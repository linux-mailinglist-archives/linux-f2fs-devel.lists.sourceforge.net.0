Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ix5sIUdKT2p5dgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 09 Jul 2026 09:14:15 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B38A372D7E7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 09 Jul 2026 09:14:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=JSc4OF0Z;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=R8qg1Vwy;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=Hl4liBEq;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=lst.de (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AsKFuw0fZiRLbwbj6PJgofSkvM6+USvX+R7Yvxkkzv4=; b=JSc4OF0ZTtLeO0t38Uep+1e4RJ
	w3TcwW7ifsa66LrrC0OTD/2YEgnRd107vnT9CCcrlaoTZRwvuaH2eCyFvXqLkD5G8PXXzZ98X47sQ
	XzkRDRWvr5ouyy+5mo24vrC9BAdUjUIdQlhEPuvJ+b0vYX+VBs601RQk3FrezRmviG1Q=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1whixP-0003MI-UI;
	Thu, 09 Jul 2026 07:14:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1whixO-0003M9-TQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Jul 2026 07:14:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uUk4afLBrSDIwMa6a8RIK4B1YBtoNsyPXhiSuipiPrs=; b=R8qg1VwyAYj3PzIO2td+/o7KWB
 sIVEP0/GlcNFHB7a6S55rzAWRxr3pyZNO6aqKNp4o79LWJGzZXYZwm63TPRzeom5RuIcHvMDe0A4v
 t26O665TfMUY+YYaYzTo3kbnLw9D5RGisB0fDyRgXr2yedaJ6IW0fku8rw1s1MT+XQHo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uUk4afLBrSDIwMa6a8RIK4B1YBtoNsyPXhiSuipiPrs=; b=Hl4liBEqqjFbzWNzZQHii/xl1Y
 vIOQwXGC7e0TRkuWF3JcpyfXs7IpSYqJWedD+hY/dcgHvGcc7sXuyQECNl6FjJYGn4h4YTKuxORex
 MucMMQyL4rLt7rK49zs59oReMERKnp68zLcMc1+f5gDB8KpF/MvSOlaFPYGeCtgDi2rc=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1whixM-0004cG-Tm for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Jul 2026 07:14:02 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 69E5C68AFE; Thu,  9 Jul 2026 09:13:52 +0200 (CEST)
Date: Thu, 9 Jul 2026 09:13:52 +0200
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@meta.com>
Message-ID: <20260709071352.GA20180@lst.de>
References: <20260708011843.1036846-1-kbusch@meta.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260708011843.1036846-1-kbusch@meta.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jul 07, 2026 at 06:18:43PM -0700, Keith Busch wrote:
 > From: Keith Busch <kbusch@kernel.org> > > Memory alignment constraints
 for direct io can vary depending on the > backing storage hardware [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1whixM-0004cG-Tm
Subject: Re: [f2fs-dev] [PATCH] fs: report direct io constraints through
 file_getattr
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: axboe@kernel.dk, linux-xfs@vger.kernel.org, brauner@kernel.org,
 jack@suse.cz, cem@kernel.org, aalbersh@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, tytso@mit.edu, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCVD_COUNT_THREE(0.00)[4];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:kbusch@meta.com,m:axboe@kernel.dk,m:linux-xfs@vger.kernel.org,m:brauner@kernel.org,m:jack@suse.cz,m:cem@kernel.org,m:aalbersh@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:kbusch@kernel.org,m:tytso@mit.edu,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B38A372D7E7

On Tue, Jul 07, 2026 at 06:18:43PM -0700, Keith Busch wrote:
> From: Keith Busch <kbusch@kernel.org>
> 
> Memory alignment constraints for direct io can vary depending on the
> backing storage hardware. Provide support through file_getattr to report
> the attributes necessary for applications to know how to construct valid
> read and write requests.

This probably wants to be split in one patch for the new UAPI,
one for the helper and one for each user.

And especially the UAPI one needs a much more detailed commit log
explaining it, including why this duplicates some of the informastion
already in statx and documenting the semantics for all the fields.

Andrey, is there a man page or other official documentation for
file_setattr/file_getattr?

> +/*
> + * Handle DIO alignment for block devices via fileattr.
> + */

Maybe note that this purely about the block device constraints,
and file systems may expose additional ones?

> +void bdev_fileattr(const struct inode *inode, struct file_kattr *fa)
> +{
> +	struct block_device *bdev;
> +
> +	memset(fa, 0, sizeof(*fa));
> +	fa->fsx_valid = true;
> +	fa->flags_valid = true;

Doing the basic file_kattr initialization here feels dangerous
if we want to be able to call this from file system implementations.
I'd rather leave the initialization to the caller.

> +
> +	bdev = blkdev_get_no_open(inode->i_rdev, false);
> +	if (!bdev)
> +		return;

.. and explicitly pass in the block device.  ->i_rdev always is
i_sb->s_dev, which might not be the relevant backing device, e.g. for XFS
it could be that or the block device in m_rtdev_targp.

If i_rdev is i_sb->s_dev we can just use sb->s_bdev without needing a new
open.

> +	fa->fsx_dio_mem_align = bdev_dma_alignment(bdev) + 1;
> +	fa->fsx_dio_offset_align = bdev_logical_block_size(bdev);
> +	fa->fsx_dio_read_offset_align = bdev_logical_block_size(bdev);
> +	fa->fsx_dio_virt_boundary_align = bdev_virt_boundary_alignment(bdev);
> +	fa->fsx_max_segments = bdev_max_segments(bdev);

How is the max_segments value defined in a way that is meaningful to
userspace?

> @@ -1005,6 +1006,27 @@ int ext4_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
>  	if (ext4_has_feature_project(inode->i_sb))
>  		fa->fsx_projid = from_kprojid(&init_user_ns, ei->i_projid);
>  
> +	if (S_ISREG(inode->i_mode)) {

You'll probably want to split this into a helper to keep it easily
readable.

> +		u32 dio_align = ext4_dio_alignment(inode);
> +
> +		if (dio_align != 0) {


> +			struct block_device *bdev = inode->i_sb->s_bdev;
> +
> +			if (dio_align == 1) {
> +				fa->fsx_dio_mem_align = bdev_dma_alignment(bdev) + 1;
> +				fa->fsx_dio_offset_align = bdev_logical_block_size(bdev);
> +				fa->fsx_dio_read_offset_align = bdev_logical_block_size(bdev);
> +			} else {
> +				fa->fsx_dio_mem_align = dio_align;
> +				fa->fsx_dio_offset_align = dio_align;
> +				fa->fsx_dio_read_offset_align = dio_align;
> +			}

Call bdev_fileattr and override the relevant field as needed?

Question to the ext4 maintainers: why does ext4_dio_alignment
affect the in-memory alignment?  If it does so, it should probably
also affect the virt boundry alignment..

> +	if (S_ISREG(inode->i_mode)) {
> +		unsigned int bsize = i_blocksize(inode);
> +		struct block_device *bdev = inode->i_sb->s_bdev;
> +
> +		if (!f2fs_force_buffered_io(inode, WRITE)) {

Same comments as for ext4.  Also f2fs does support multiple devices,
but I'm not sure how data is placed on them, or if a file can be
on multiple devices.  We'll need input from the f2fs
maintainers/contributors here.

> @@ -88,8 +89,12 @@ int vfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
>  	struct inode *inode = d_inode(dentry);
>  	int error;
>  
> -	if (!inode->i_op->fileattr_get)
> -		return -ENOIOCTLCMD;
> +	if (!inode->i_op->fileattr_get) {
> +		if (!S_ISBLK(inode->i_mode))
> +			return -ENOIOCTLCMD;
> +		bdev_fileattr(inode, fa);
> +		return 0;

Don't we also want to fill out the attributes for block devices
on file systems that provide a ->fileattr_get?.   Also if we fill
out something, we need the security_inode_file_getattr as well.

>  /**
> @@ -145,6 +155,8 @@ static int file_attr_to_fileattr(const struct file_attr *fattr,
>  
>  	if (fattr->fa_xflags & ~mask)
>  		return -EINVAL;
> +	if (fattr->fa_pad)
> +		return -EINVAL;

How is this related?

> +	if (whichfork == XFS_DATA_FORK && S_ISREG(VFS_I(ip)->i_mode)) {

This probably wants a separate helper.

> +		struct xfs_buftarg *target = xfs_inode_buftarg(ip);
> +		struct block_device *bdev = target->bt_bdev;

.. and if the generic helpers gets an explicitl bdev we can use it
here and just override one value for for xfs_is_cow_inode().

> +static inline unsigned int bdev_virt_boundary_alignment(struct block_device *bdev)

Overly long line.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
