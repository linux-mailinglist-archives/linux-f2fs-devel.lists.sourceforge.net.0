Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D529287C78
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Oct 2020 21:27:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kQbZI-0002RC-Cw; Thu, 08 Oct 2020 19:27:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <krisman@collabora.com>) id 1kQbZH-0002R1-Ks
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 08 Oct 2020 19:27:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sQZnPgFNOhXnxga8xwHOY9phqXPulCRt6m3xzpnof9I=; b=CzW8+ek6rng7YOAn41yG3x/hxi
 BCN/kCDEZwPKI44lnax9j6diyxF8Qox+HdR7Iz+IwuRwXkAxAKKIv3lpBWWNClRYBynm4EfRDhH9x
 LzlWKAjU/kq3FU/8KImvFfCfuN8F0eZhqCUGK2i3LaGwXoUyqmbXaQvbRpCG0n8WrUZs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sQZnPgFNOhXnxga8xwHOY9phqXPulCRt6m3xzpnof9I=; b=gFGtZwJXl8rzq1jOI9lLSOT0ja
 jjzKRQYopqyQFCXqrot8shc4qDdE5mgTzu4Wl+6aGke/0o8gPAHQJ7c5NVGFKoJkNCb0ogyocNvvW
 SHCOkKnkDGZBYBFh3SE+GQxTrfRgfMOsI8TlHW/lOCuOppXnmUHQl8IKOmltQY+QO5Iw=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kQbZB-003P4u-7T
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 08 Oct 2020 19:27:11 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id EB80529DAB8
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Eric Biggers <ebiggers@kernel.org>
Organization: Collabora
References: <00000000000085be6f05b12a1366@google.com>
 <20201008191522.1948889-1-ebiggers@kernel.org>
Date: Thu, 08 Oct 2020 15:26:45 -0400
In-Reply-To: <20201008191522.1948889-1-ebiggers@kernel.org> (Eric Biggers's
 message of "Thu, 8 Oct 2020 12:15:22 -0700")
Message-ID: <87ft6oldsa.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: collabora.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1kQbZB-003P4u-7T
Subject: Re: [f2fs-dev] [PATCH] f2fs: reject CASEFOLD inode flag without
 casefold feature
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
Cc: Daniel Rosenberg <drosen@google.com>, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 syzbot+05139c4039d0679e19ff@syzkaller.appspotmail.com,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eric Biggers <ebiggers@kernel.org> writes:

> From: Eric Biggers <ebiggers@google.com>
>
> syzbot reported:
>
>     general protection fault, probably for non-canonical address 0xdffffc0000000001: 0000 [#1] PREEMPT SMP KASAN
>     KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
>     CPU: 0 PID: 6860 Comm: syz-executor835 Not tainted 5.9.0-rc8-syzkaller #0
>     Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
>     RIP: 0010:utf8_casefold+0x43/0x1b0 fs/unicode/utf8-core.c:107
>     [...]
>     Call Trace:
>      f2fs_init_casefolded_name fs/f2fs/dir.c:85 [inline]
>      __f2fs_setup_filename fs/f2fs/dir.c:118 [inline]
>      f2fs_prepare_lookup+0x3bf/0x640 fs/f2fs/dir.c:163
>      f2fs_lookup+0x10d/0x920 fs/f2fs/namei.c:494
>      __lookup_hash+0x115/0x240 fs/namei.c:1445
>      filename_create+0x14b/0x630 fs/namei.c:3467
>      user_path_create fs/namei.c:3524 [inline]
>      do_mkdirat+0x56/0x310 fs/namei.c:3664
>      do_syscall_64+0x31/0x70 arch/x86/entry/common.c:46
>      entry_SYSCALL_64_after_hwframe+0x44/0xa9
>     [...]
>
> The problem is that an inode has F2FS_CASEFOLD_FL set, but the
> filesystem doesn't have the casefold feature flag set, and therefore
> super_block::s_encoding is NULL.
>
> Fix this by making sanity_check_inode() reject inodes that have
> F2FS_CASEFOLD_FL when the filesystem doesn't have the casefold feature.
>
> Reported-by: syzbot+05139c4039d0679e19ff@syzkaller.appspotmail.com
> Fixes: 2c2eb7a300cd ("f2fs: Support case-insensitive file name lookups")
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks good.  For the record, this is fixed on ext4 already.

Reviewed-by: Gabriel Krisman Bertazi <krisman@collabora.com>

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
