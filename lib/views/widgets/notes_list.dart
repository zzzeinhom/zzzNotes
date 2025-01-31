import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:zzznotes/cubits/notes_cubit/notes_cubit.dart';
import 'package:zzznotes/models/note_model.dart';
import 'package:zzznotes/views/widgets/note_card.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NotesCubit>(context).notes ?? [];
        debugPrint("Notes: $notes");
        return Expanded(
          child: StaggeredGridView.countBuilder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(top: 16),
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            itemCount: notes.length,
            staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
            itemBuilder: (context, index) => NoteCard(note: notes[index]),
          ),
        );
      },
    );
  }
}
