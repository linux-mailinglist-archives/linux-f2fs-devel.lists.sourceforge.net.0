Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E4979110583
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Dec 2019 20:52:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1icEDg-0004iG-Jd; Tue, 03 Dec 2019 19:52:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <krisman@collabora.com>) id 1icEDe-0004i1-VX
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Dec 2019 19:52:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0PvaWL5bp3OyayqEteEnymHXOfnE6BIv5XBY99d3q/8=; b=JwEc4NbTrFecjJ2NZGGF9MD7lV
 rOSnV7WD34a5PShuL482VVsYmKdm1wEH1p/+PI0wuvyZkdnE2eO3YXcdKXHXtZHuKma2l6KBZwsXN
 YYfhpF2HtPQ4FMEF1iY2F5vPSPt4X41vhKQCiZy3uLSoQZRlPWtFahxxQYKGgX/GFQLQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0PvaWL5bp3OyayqEteEnymHXOfnE6BIv5XBY99d3q/8=; b=I61X0zxQwbIccNoetwoPRRt4Ek
 gxW8pZIrxyQfxzArG8kFgFK+3XrLGzd2AIz0uaim4bUHWr1RND3lwqCuhdilPfCWe7zwlqZteH81/
 Cv+SBiBA9U91k05pPtc9LXIPPdazS2+pYO9s80rRELK9cfBl/bYXKAOnJ8a/jnI3UMwk=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1icEDc-002qnr-V5
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Dec 2019 19:52:22 +0000
Received: from localhost (unknown [IPv6:2610:98:8005::647])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: krisman)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6C9562909E7;
 Tue,  3 Dec 2019 19:42:14 +0000 (GMT)
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Gao Xiang <gaoxiang25@huawei.com>
Organization: Collabora
References: <20191203051049.44573-1-drosen@google.com>
 <20191203051049.44573-5-drosen@google.com>
 <20191203074154.GA216261@architecture4>
Date: Tue, 03 Dec 2019 14:42:10 -0500
In-Reply-To: <20191203074154.GA216261@architecture4> (Gao Xiang's message of
 "Tue, 3 Dec 2019 15:41:54 +0800")
Message-ID: <85wobdb3hp.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [46.235.227.227 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1icEDc-002qnr-V5
Subject: Re: [f2fs-dev] [PATCH 4/8] vfs: Fold casefolding into vfs
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
Cc: Theodore Ts'o <tytso@mit.edu>, Daniel Rosenberg <drosen@google.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Gao Xiang <gaoxiang25@huawei.com> writes:

> On Mon, Dec 02, 2019 at 09:10:45PM -0800, Daniel Rosenberg wrote:
>> Ext4 and F2fs are both using casefolding, and they, along with any other
>> filesystem that adds the feature, will be using identical dentry_ops.
>> Additionally, those dentry ops interfere with the dentry_ops required
>> for fscrypt once we add support for casefolding and encryption.
>> Moving this into the vfs removes code duplication as well as the
>> complication with encryption.
>> 
>> Currently this is pretty close to just moving the existing f2fs/ext4
>> code up a level into the vfs, although there is a lot of room for
>> improvement now.
>> 
>> Signed-off-by: Daniel Rosenberg <drosen@google.com>
>
> I'm afraid that such vfs modification is unneeded.
>
> Just a quick glance it seems just can be replaced by introducing some
> .d_cmp, .d_hash helpers (or with little modification) and most non-Android
> emulated storage files are not casefolded (even in Android).
>
> "those dentry ops interfere with the dentry_ops required for fscrypt",
> I don't think it's a real diffculty and it could be done with some
> better approach instead.

It would be good to avoid dentry_ops in general for these cases.  It
doesn't just interfere with fscrypt, but also overlayfs and others.

The difficulty is that it is not trivial to change dentry_ops after
dentries are already installed in the dcache.  Which means that it is
hard to use different dentry_ops for different parts of the filesystem,
for instance when converting a directory to case-insensitive or back
to case-sensitive.

In fact, currently and for case-insensitive at least, we install generic
hooks for the entire case-insensitive filesystem and use it even for
!IS_CASEFOLDED() directories. This breaks overlayfs even if we don't
have a single IS_CASEFOLDED() directory at all, just by having the
superblock flag, we *must* set the dentry_ops, which already breaks
overlayfs.

I think Daniel's approach of moving this into VFS is the simplest way to
actually solve the issue, instead of extending and duplicating a lot of
functionality into filesystem hooks to support the possible mixes of
case-insensitive, overlayfs and fscrypt.

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
