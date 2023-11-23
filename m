Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C3F7F6849
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Nov 2023 21:15:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r6G6m-0000Uo-WD;
	Thu, 23 Nov 2023 20:15:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <viro@ftp.linux.org.uk>) id 1r6G6k-0000Ud-Mu
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Nov 2023 20:15:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D6eauRCleakOAVXg1WO7OewoZlBriSXWxKFLHPSQ66o=; b=B3obQgZuuU1Ig/GEaSEslKs3aN
 VsnzF75/07ARDE2LXgbfbeYU0MQfroMyhNcuA2+dqtgoUdPoJbqOep8HqD/cRHaqWgzpV/ViDxDJQ
 n+U9wgekL53MUXW5ZfjV3PvnRszJ3JNh/udy/DFTH4VmgYUPuWDLmFn6vYtxIe7fpIfw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=D6eauRCleakOAVXg1WO7OewoZlBriSXWxKFLHPSQ66o=; b=gpuxZYBhOO2hv9pjTEmUb9I0Lh
 yloWW4VHCpSPCURbfM6mGgFN0nPgYQxbiwQDYITXLBzPdT5037aWeEjAdHj52y4EKhO+v8gXrK9qO
 z0ri6CVcqep2WbZZFnVmItho0gSPGuLHjbVJGdOkEiuh96seQFhEuarurIrqDwsAmj3Q=;
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r6G6k-0003Zp-4v for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Nov 2023 20:15:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=D6eauRCleakOAVXg1WO7OewoZlBriSXWxKFLHPSQ66o=; b=KlzKBGwYHxj3Y3yyDacRn2/fO1
 TOvCft6vyHXIu0droOUNqzblCUjjn9o2GTgoOp9ZQzMWXecL6CZVcXI882xS02OWO3hGui0W27vV0
 D3g1HJzDL3O75gbBTgqtURXNPCL3TAuThQmOdEh9pP5IjplRQpCvz7Tur9njCPspxS5kV1JtC6ctk
 E/cbLSwgG5XgceBPvIL3TSeCcbZIe2JpLRliQAcGVV4jWkDu9yB52mr3JV+w+CDsgPlqRg+w7e4oK
 3B2epbPIer5J1mlyxx2JWkXKptokJw20BrHE+iWi7u3KWDpLI0Rj1boTvY2Qr0B5ua1AyCFwRZmeD
 wowHHMiw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1r6G6V-002Eoh-1K; Thu, 23 Nov 2023 20:15:15 +0000
Date: Thu, 23 Nov 2023 20:15:15 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Gabriel Krisman Bertazi <gabriel@krisman.be>
Message-ID: <20231123201515.GA532258@ZenIV>
References: <655a9634.630a0220.d50d7.5063SMTPIN_ADDED_BROKEN@mx.google.com>
 <20231120-nihilismus-verehren-f2b932b799e0@brauner>
 <CAHk-=whTCWwfmSzv3uVLN286_WZ6coN-GNw=4DWja7NZzp5ytg@mail.gmail.com>
 <20231121022734.GC38156@ZenIV> <20231122211901.GJ38156@ZenIV>
 <CAHk-=wh5WYPN7BLSUjUr_VBsPTxHOcMHo1gOH2P4+5NuXAsCKA@mail.gmail.com>
 <20231123171255.GN38156@ZenIV> <20231123182426.GO38156@ZenIV>
 <87bkbki91c.fsf@> <20231123195327.GP38156@ZenIV>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231123195327.GP38156@ZenIV>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Nov 23, 2023 at 07:53:27PM +0000, Al Viro wrote: >
 Huh? If it really depends only upon the superblock, just set it in ->s_d_op
 > when you set the superblock up. > > Again, whatever setup you do for dentry
 in ->lookup(), you either > * have a filesys [...] 
 Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r6G6k-0003Zp-4v
Subject: Re: [f2fs-dev] [PATCH v6 0/9] Support negative dentries on
 case-insensitive ext4 and f2fs
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
Cc: Christian Brauner <brauner@kernel.org>, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Nov 23, 2023 at 07:53:27PM +0000, Al Viro wrote:

> Huh?  If it really depends only upon the superblock, just set it in ->s_d_op
> when you set the superblock up.
> 
> Again, whatever setup you do for dentry in ->lookup(), you either
> 	* have a filesystem that never picks an existing directory alias
> (e.g. doesn't allow open-by-fhandle or has a very unusual implementation
> of related methods, like e.g. shmem), or
> 	* have that setup misplaced, in part that applies to all dentries out
> there (->s_d_op for universal ->d_op value, ->d_init() for uniform allocation
> of objects hanging from ->d_fsdata and other things like that), or
> 	* need to figure out how to transfer the result to alias (manually
> after d_splice_alias(), if races do not matter or using a new method explicitly
> for that), or
> 	* lose that state for aliases.

Note, BTW, that fscrypt tries to be very special in its handling of that
stuff - see fscrypt_handle_d_move() thing and comments in front of its
definition.  Then take a look at the place where it's called.

BTW, it looks like it's broken, since it discounts the possibility of splice
caused by lookup on no-key name.  You get DCACHE_NOKEY_NAME removed unconditionally
there, no-key or not.

It's not impossible that the boilerplate around the fscrypt_has_permitted_context()
calls in fscrypt-enabled ->lookup() instances somehow prevents those, but if so,
it's not obvious from the causual look.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
