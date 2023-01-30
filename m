Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CE91A680852
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Jan 2023 10:16:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pMQHY-0005bG-Qp;
	Mon, 30 Jan 2023 09:16:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1pMQH8-0005ay-4p
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jan 2023 09:16:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G3kGnuF2seECswQYReilqUIUVUWzsfhznXPOaq3kkSY=; b=CujaPY5KBpbwotpRi6HKgSxU4G
 8YKXSAZzdIaAVSFYPHcc9k2thZ4d9aGmfu1zHuAy/oQoIX/jaLdrCnenz/GXDGNmR2OJmY2sG3rVy
 fJRAciIbu7sugXiapsnw5OMnxOOTDogdPxi/Oa9XKMGi4rZartKkq74ODliOEfP+VBkA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G3kGnuF2seECswQYReilqUIUVUWzsfhznXPOaq3kkSY=; b=RwwWlzC1mVl385dfQxA09oGtvO
 Hz1o/b6dlRmGZs7MHA47eFhqM1dWXDZrz6/uSC97IVtY36m52ZVvXor5NJ+502RZ7eXdio8JVUcSj
 /8IxYL0iviRQiLG/IodJTeZFRvVo0NBdT4k5AGvmnXbZGqwoqg1+uNBV1mgTnU2Syk/A=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pMQH5-003SY1-Il for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jan 2023 09:16:29 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 524FF68BEB; Mon, 30 Jan 2023 10:16:15 +0100 (CET)
Date: Mon, 30 Jan 2023 10:16:15 +0100
From: Christoph Hellwig <hch@lst.de>
To: Christian Brauner <brauner@kernel.org>
Message-ID: <20230130091615.GB5178@lst.de>
References: <20230125-fs-acl-remove-generic-xattr-handlers-v1-0-6cf155b492b6@kernel.org>
 <20230130091052.72zglqecqvom7hin@wittgenstein>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230130091052.72zglqecqvom7hin@wittgenstein>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 30, 2023 at 10:10:52AM +0100, Christian Brauner
 wrote: > However, a few filesystems still rely on the ->list() method of
 the > generix POSIX ACL xattr handlers in their ->listxattr() inode [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
X-Headers-End: 1pMQH5-003SY1-Il
Subject: Re: [f2fs-dev] [PATCH 00/12] acl: remove remaining posix acl
 handlers
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
Cc: reiserfs-devel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, Seth Forshee <sforshee@kernel.org>,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, ocfs2-devel@oss.oracle.com,
 Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 30, 2023 at 10:10:52AM +0100, Christian Brauner wrote:
> However, a few filesystems still rely on the ->list() method of the
> generix POSIX ACL xattr handlers in their ->listxattr() inode operation.
> This is a very limited set of filesystems. For most of them there is no
> dependence on the generic POSIX ACL xattr handler in any way.
> 
> In addition, during inode initalization in inode_init_always() the
> registered xattr handlers in sb->s_xattr are used to raise IOP_XATTR in
> inode->i_opflags.
> 
> With the incoming removal of the legacy POSIX ACL handlers it is at
> least possible for a filesystem to only implement POSIX ACLs but no
> other xattrs. If that were to happen we would miss to raise IOP_XATTR
> because sb->s_xattr would be NULL. While there currently is no such
> filesystem we should still make sure that this just works should it ever
> happen in the future.

Now the real questions is: do we care?  Once Posix ACLs use an
entirely separate path, nothing should rely on IOP_XATTR for them.
So instead I think we're better off auditing all users of IOP_XATTR
and making sure that nothing relies on them for ACLs, as we've very
much split the VFS concept of ACLs from that from xattrs otherwise.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
