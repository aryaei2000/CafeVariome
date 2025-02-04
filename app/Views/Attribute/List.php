<?= $this->extend('layout/dashboard') ?>
<?= $this->section('content') ?>

<div class="row">
	<div class="col">
		<h2><?= $title ?> of '<?= $source_name ?>'</h2>
	</div>
</div>
<hr>
<?php if($statusMessage): ?>
	<div class="row">
		<div class="col">
			<div class="alert alert-<?= $statusMessageType ?>">
				<?php echo $statusMessage ?>
			</div>
		</div>
	</div>
<?php endif; ?>
<table class="table table-bordered table-striped table-hover" id="attributestable">
	<thead>
		<tr>
			<th>Name</th>
			<th>Display Name</th>
			<th>Type</th>
			<th>Storage Location</th>
			<th>Actions</th>
		</tr>
	</thead>
	<tbody>
	<?php foreach ($attributes as $attribute): ?>
		<tr>
			<td><?= $attribute->name ?></td>
			<td><?= $attribute->display_name ?></td>
			<td><?= $attribute->type_text ?></td>
			<td><?= $attribute->storage_location ?></td>
			<td>
				<a href="<?= base_url('Value/List') . '/' . $attribute->getID() ?>" data-toggle="tooltip" data-placement="top" title="View Values">
					<i class="fa fa-list text-success"></i>
				</a>
				<a href="<?= base_url($controllerName . '/Update') . '/' . $attribute->getID() ?>" data-toggle="tooltip" data-placement="top" title="Edit Attribute">
					<i class="fa fa-edit text-warning"></i>
				</a>
				<a href="<?= base_url('AttributeMapping/List') . '/' . $attribute->getID() ?>" data-toggle="tooltip" data-placement="top" title="View Mappings">
					<i class="fa fa-map-signs text-danger"></i>
				</a>
				<?php if($attribute->type == ATTRIBUTE_TYPE_ONTOLOGY_TERM): ?>
				<a href="<?= base_url($controllerName . '/OntologyAssociations') . '/' . $attribute->getID() ?>" data-toggle="tooltip" data-placement="top" title="View Related Ontologies">
					<i class="fa fa-project-diagram text-secondary"></i>
				</a>
				<?php endif; ?>
				<a href="<?= base_url($controllerName . '/Details') . '/' . $attribute->getID() ?>" data-toggle="tooltip" data-placement="top" title="View Attribute">
					<i class="fa fa-eye text-info"></i>
				</a>
			</td>
		</tr>
	<?php endforeach; ?>
	</tbody>
</table>
<hr>
<div class="row mb-5">
	<div class="col">
		<a class="btn btn-secondary bg-gradient-secondary" href="<?= base_url('Source') ?>">
			<i class="fa fa-database"></i> View Sources
		</a>
		<a class="btn btn-info bg-gradient-info" href="<?= base_url('Source/Elasticsearch/' . $source_id) ?>">
			<i class="fa fa-search"></i> Elasticsearch Index Status
		</a>
		<a class="btn btn-info bg-gradient-info" href="<?= base_url('Source/Neo4J/' . $source_id) ?>">
			<i class="fa fa-project-diagram"></i> Neo4J Index Status
		</a>
		<a class="btn btn-info bg-gradient-info" href="<?= base_url('Source/UserInterface/' . $source_id) ?>">
			<i class="fa fa-desktop"></i> User Interface Index Status
		</a>
	</div>
</div>
<?= $this->endSection() ?>
