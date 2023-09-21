import * as FilePond from "filepond";
import FilePondPluginImagePreview from "filepond-plugin-image-preview";
import FilepondPluginFileValidateType from "filepond-plugin-file-validate-type";

document.addEventListener("turbo:load", loadFilePond);


function loadFilePond () {
FilePond.registerPlugin(
  FilePondPluginImagePreview,
  FilepondPluginFileValidateType
);

// Get a reference to the file input element
const inputElement = document.querySelector("#post-images");

// Create a FilePond instance
const pond = FilePond.create(inputElement, {
  credits: {},
  storeAsFile: true,
  allowMultiple: true,
  allowReorder: true,
  acceptedFileTypes: ["image/*"],
});
}