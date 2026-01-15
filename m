Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3995DD23205
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 09:30:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jczcb36O/do19FfgxIuBVBGWGOgrg375BO+ciQC9laU=; b=YFpBzNyz0zikRXPHJ1ykJNPvJn
	zY0QVFFCfz1npIKt5iqk3Pkpsy19s3Vm3ASTTGZkCG7NfK6VqVpIkN/hsY7QbcAdjgz9xlKmjHBkR
	1gEykU1VLuA3NF26f+W8LbH9iHUDaXd4aGoKC84b0AC8QZiKEVfwUbZkLM/SX3GghlTI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgIjx-0001QU-Jj;
	Thu, 15 Jan 2026 08:30:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1vgIju-0001OO-4o
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Jan 2026 08:29:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NGxDDgulW3++GzPWbfSaZyDLWczxy2fM772kCefea+M=; b=FNBFRadv9TADVMx94v5pCoIDde
 /LgCRWlqwcSZVk2RO8XkLWeAJKXN9gg/tUPgTeaaR5gouVx90e3SWME8KHQq2NmVjw68VFu0C0ItQ
 2QoylNgeR+o3YmnUIRvq9gr770oVk3aRTGe5yfQxRi8uW1IjmygvN/3PuWcr9WKf6Wc0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NGxDDgulW3++GzPWbfSaZyDLWczxy2fM772kCefea+M=; b=ZdvvLXwo28vfZ0Lw6LrPOCe6fi
 aHjIehXdIWD6ur+Ago3aUKYgOo3I/6XUwj7laZB8RQs5922MxRRAuO64AZZ4wsthI8Tq0OCfFcj5x
 c3ougft054KUoGzVVZ9W85p7PxxWYav0kZvHF8hpJmzYWIyn5BG7OXjWvtcbFcilP7JA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgIjt-0007Jd-LM for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Jan 2026 08:29:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3F4EF43498;
 Thu, 15 Jan 2026 08:29:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 565A2C116D0;
 Thu, 15 Jan 2026 08:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768465787;
 bh=R14DaZGFpUHZtfwpnZ4r6zV65WrZFacicwafJAAUhi4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q12ytVWRB/0h7GDBzmyz96GYbtpCYfuDB6mEovp08L88s5lkn+FSy9Ht+kimtsdnN
 mi4/mmYSNPdJspu5E/BB0NNx79CBCacFyIEG32pUQD855YoYv46vW5EgzWLWJf0ytI
 KNY0KrjzCnkLgU5cpZHiGEGJmZiNjGwLLE8i7g84cV1btC11xxx335cRe2pbfv1Yhy
 zmc6dMQgcYXcQdEmgUM8rDh/I53s7XQPHjjsynnoAp/7hUcTmPxKX6xcE5KfQb8vgj
 kCmTFroVDvF5ZfhlerkVmeLgGqOwQ6n3cPnrGi6lH87Yqy9xwOZGlG0+cUosUv1j+o
 qsBojF262UC2Q==
Date: Thu, 15 Jan 2026 09:29:37 +0100
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20260115-mitgift-crashtest-35039325f65c@brauner>
References: <20260114142900.3945054-1-cel@kernel.org>
 <20260114142900.3945054-2-cel@kernel.org>
 <3kq2tbdcoxxw3y2gseg7vtnhnze5ee536fu4rnsn22yjrpsmb4@fpfueqqiji5q>
 <7b6aa90f-79dc-443a-8e5f-3c9b88892271@app.fastmail.com>
 <20260114200130.GJ15551@frogsfrogsfrogs>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260114200130.GJ15551@frogsfrogsfrogs>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jan 14, 2026 at 12:01:30PM -0800, Darrick J. Wong
 wrote: > On Wed, Jan 14, 2026 at 02:01:14PM -0500, Chuck Lever wrote: > >
 > > > > On Wed, Jan 14, 2026, at 1:11 PM, Jan Kara wrote: > > > On W [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vgIjt-0007Jd-LM
Subject: Re: [f2fs-dev] [PATCH v4 01/16] fs: Add case sensitivity info to
 file_kattr
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
From: Christian Brauner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>, Paulo Alcantara <pc@manguebit.org>,
 Yuezhang Mo <yuezhang.mo@sony.com>, Carlos Maiolino <cem@kernel.org>,
 almaz.alexandrovich@paragon-software.com, adilger.kernel@dilger.ca,
 vira@imap.suse.de, linux-cifs@vger.kernel.org, Chuck Lever <cel@kernel.org>,
 Steve French <sfrench@samba.org>, Viacheslav Dubeyko <slava@dubeyko.com>,
 linux-ext4@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 Shyam Prasad N <sprasad@microsoft.com>, frank.li@vivo.com,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, glaubitz@physik.fu-berlin.de,
 Jaegeuk Kim <jaegeuk@kernel.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 linux-nfs@vger.kernel.org, Theodore Tso <tytso@mit.edu>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, Chuck Lever <chuck.lever@oracle.com>,
 Hans de Goede <hansg@kernel.org>, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Sungjong Seo <sj1557.seo@samsung.com>,
 Trond Myklebust <trondmy@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jan 14, 2026 at 12:01:30PM -0800, Darrick J. Wong wrote:
> On Wed, Jan 14, 2026 at 02:01:14PM -0500, Chuck Lever wrote:
> > 
> > 
> > On Wed, Jan 14, 2026, at 1:11 PM, Jan Kara wrote:
> > > On Wed 14-01-26 09:28:44, Chuck Lever wrote:
> > >> From: Chuck Lever <chuck.lever@oracle.com>
> > >> 
> > >> Enable upper layers such as NFSD to retrieve case sensitivity
> > >> information from file systems by adding case_insensitive and
> > >> case_nonpreserving boolean fields to struct file_kattr.
> > >> 
> > >> These fields default to false (POSIX semantics: case-sensitive and
> > >> case-preserving), allowing filesystems to set them only when
> > >> behavior differs from the default.
> > >> 
> > >> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
> > > ...
> > >> diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
> > >> index 66ca526cf786..07286d34b48b 100644
> > >> --- a/include/uapi/linux/fs.h
> > >> +++ b/include/uapi/linux/fs.h
> > >> @@ -229,10 +229,20 @@ struct file_attr {
> > >>  	__u32 fa_nextents;	/* nextents field value (get)   */
> > >>  	__u32 fa_projid;	/* project identifier (get/set) */
> > >>  	__u32 fa_cowextsize;	/* CoW extsize field value (get/set) */
> > >> +	/* VER1 additions: */
> > >> +	__u32 fa_case_behavior;	/* case sensitivity (get) */
> > >> +	__u32 fa_reserved;
> > >>  };
> > >>  
> > >>  #define FILE_ATTR_SIZE_VER0 24
> > >> -#define FILE_ATTR_SIZE_LATEST FILE_ATTR_SIZE_VER0
> > >> +#define FILE_ATTR_SIZE_VER1 32
> > >> +#define FILE_ATTR_SIZE_LATEST FILE_ATTR_SIZE_VER1
> > >> +
> > >> +/*
> > >> + * Case sensitivity flags for fa_case_behavior
> > >> + */
> > >> +#define FS_CASE_INSENSITIVE	0x00000001	/* case-insensitive lookups */
> > >> +#define FS_CASE_NONPRESERVING	0x00000002	/* case not preserved */
> > >
> > > This is a matter of taste so not sure what others think about it but
> > > file_attr already have fa_xflags field and there is already one flag which
> > > doesn't directly correspond to on-disk representation (FS_XFLAG_HASATTR) so
> > > we could also put the two new flags in there... I have hard time imagining
> > > fa_case_behavior would grow past the two flags you've introduced so u32
> > > seems a bit wasteful.
> > 
> > No problem. I'll wait for additional guidance on this.
> 
> Sounds like a better use of space in struct file_attr than adding
> another pair of u32.

Fine by me as well.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
