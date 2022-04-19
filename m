Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2575F506F94
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Apr 2022 16:00:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ngoP0-0004V4-1E; Tue, 19 Apr 2022 14:00:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <brauner@kernel.org>) id 1ngoOy-0004Uy-Eq
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 14:00:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rKUNi0nF/NCKoA23vipiUB0tf5RFUgxY2YJjHxCsX2o=; b=UwZS7M3ix4uuQ9SEEyelY78YJr
 pAJM6+tFZHAQfBRy12RtfeYgZQlBsvrj+za1Djs8dyeLOHMQKuqkMg46I+qwxQtyfI65LjOXySa41
 PDsOon6vaXZz9w7iFIo0NrWVzkMeSgGJCm9ZXzkmcDpwQHfCv+zKG2VSbInxN3ssauho=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rKUNi0nF/NCKoA23vipiUB0tf5RFUgxY2YJjHxCsX2o=; b=aeqUsm+hmfzlmEUwc3td73soQf
 DbT5FmqM0mpxNd9hJQpGHsKSVmPkAYKxujFvC+Aln9lOBlDbSKpFp8sY0KDazqfwPCzyyUV64vfCd
 9mnX/xrDS8yBjRF52J9Dx0GzhlSeU4TCHRFCQLJK/nif2QyR8z8G2aiN8EbZ1yfmGoGo=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ngoOg-0002z7-Vd
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 14:00:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7655AB81984;
 Tue, 19 Apr 2022 13:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0AEFC385A8;
 Tue, 19 Apr 2022 13:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650376789;
 bh=LRUihLM0sWjX5MXCAlAIJzgJ3la9JpKK4DT62glq5RY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LjQqeNFGBmXzAU/E3PB1IJxg7jN6ZaDvICiEzZfXo77fHqJm3qxjocbd5INjJXyJS
 4jo0lj8y31etKtnPvLE7hBOEJeH73NI2KXTRajoHzoNB5g+vbouicMy+WnC9ree9uM
 kFN2gYuG7zA9RvdaeWVVyeEym2DtGc0gIuiMBcOHYUi+lB6IYj5O5Qbk3JQH9xqbdQ
 xPbuUjketdhhMi23UGJuxnaxx7hcfzqc6z/vw69g0y5+D6pHtLbD6GNfslX7K+gAuU
 q8LQ3PdyL22hqJbnPSLy0XSwGhaTbpsE9aTWHXcN6R7cot7UpwN93NLW2ooJEqJZtT
 W+X1Tfqf2LNzw==
Date: Tue, 19 Apr 2022 15:59:38 +0200
From: Christian Brauner <brauner@kernel.org>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Message-ID: <20220419135938.flv776f36v6xb6sj@wittgenstein>
References: <1650368834-2420-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1650368834-2420-4-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1650368834-2420-4-git-send-email-xuyang2018.jy@fujitsu.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Apr 19, 2022 at 07:47:10PM +0800, Yang Xu wrote: >
 Since nfs3_proc_create/nfs3_proc_mkdir/nfs3_proc_mknod these rpc ops are
 called > by nfs_create/nfs_mkdir/nfs_mkdir these inode ops, so they [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ngoOg-0002z7-Vd
Subject: Re: [f2fs-dev] [PATCH v4 4/8] NFSv3: only do posix_acl_create under
 CONFIG_NFS_V3_ACL
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
Cc: linux-nfs@vger.kernel.org, djwong@kernel.org, david@fromorbit.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jlayton@kernel.org,
 ceph-devel@vger.kernel.org, ntfs3@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Apr 19, 2022 at 07:47:10PM +0800, Yang Xu wrote:
> Since nfs3_proc_create/nfs3_proc_mkdir/nfs3_proc_mknod these rpc ops are called
> by nfs_create/nfs_mkdir/nfs_mkdir these inode ops, so they are all in control of
> vfs.
> 
> nfs3_proc_setacls does nothing in the !CONFIG_NFS_V3_ACL case, so we put
> posix_acl_create under CONFIG_NFS_V3_ACL and it also doesn't affect
> sattr->ia_mode value because vfs has did umask strip.
> 
> Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
> ---

I have the same comment as on the xfs patch. If the filesystem has opted
out of acls and SB_POSIXACL isn't set in sb->s_flags then
posix_acl_create() is a nop. Why bother placing it under an ifdef?

It adds visual noise and it implies that posix_acl_create() actually
does something even if the filesystem doesn't support posix acls.

Unless this actually fixes something I'd drop this patch too.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
