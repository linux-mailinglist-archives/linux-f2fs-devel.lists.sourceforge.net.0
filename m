Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A710799F37C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Oct 2024 18:56:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t0kqL-0001Wg-5p;
	Tue, 15 Oct 2024 16:56:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1t0kqJ-0001WZ-J7
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Oct 2024 16:56:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZVzzYWGEjNAzgk8WdQvBiFJH9KBq6z+P/jfY5RA0TjQ=; b=K4dI2ttNvHTx+jpP8IS4s0os56
 5mTexfE+KNdcfb66iLF/r+1+4hwfejW1b/6oCN+/jzzUumEHTvqueX/AdiCxCOWy8NzPF5i0kbkIt
 GUxfGqP+S0jGAn3b7znEMq/WgllPTGSriO0erqJH2ls9TVAAe+7nxMEOojYxUMWgJj9E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZVzzYWGEjNAzgk8WdQvBiFJH9KBq6z+P/jfY5RA0TjQ=; b=gxcFP3FE5pWOUkvtOLQE+li34x
 sfX6plJv/xsKgiGiJAGBf8G3aGNtStrRk9VGh3D2EeGP2N0STP5TZfaPkHouHAt55lSDrfUSPWowl
 SCVle8EZtul+E8gRcUadkJV1MklaKQtuQ1jIS9uj23GNHgE66BM0ZZfZa2UWQwdsFll4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t0kqI-0003HM-TW for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Oct 2024 16:56:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 163865C541A;
 Tue, 15 Oct 2024 16:56:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB58FC4CEC6;
 Tue, 15 Oct 2024 16:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729011368;
 bh=hfqJKue+3XYOgvEDE+ykbHkzEUEGlHvjzIkhYRO8y10=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LOL0ad3a5QF4D6nDEDi6WusaMnXL8w3i+ooPdvVVEo5G0E0G2oPhKjYBWvQRjzh/m
 fSmqcwvIsq1FOrvt7YVrhexSOl6xXfLw6ccABZHDJhbDoWnSryKGYppZe52OCy6jTf
 FgOyT3CmQ8DIsB+K106HfNz3tQsXEOji+qDUHTl7fIibCmNCauC2KinUDgRy+SA2RB
 mNe3QyOwshLGSTY5Pmi5GlGYOb3Qu2kHKOd9dzw2Q8TWiEOrDaPAGn0hzboIO8cNBD
 jir7BiC3OKObuUy/QOCxSFQDgexAEgXGjXVvvhLGeShCvqD3foJsGo7pwPaXXwKtss
 C/Jw4Qd1fZdDg==
Date: Tue, 15 Oct 2024 16:56:05 +0000
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <Zw6epcWDc13p1yCM@google.com>
References: <20241010192626.1597226-1-daeho43@gmail.com>
 <ZwyyiG0pqXoBFIW5@infradead.org>
 <CACOAw_yvb=jacbXVr76bSbCEcud=D1vw5rJVDO+TjZbMLYzdZQ@mail.gmail.com>
 <Zw1J30Fn48uYCwK7@google.com> <Zw34CMxJB-THlGW0@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zw34CMxJB-THlGW0@infradead.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/14, Christoph Hellwig wrote: > On Mon, Oct 14, 2024
 at 04:42:07PM +0000, Jaegeuk Kim wrote: > > > > > > Plz, refer to this patch
 and the description there. > > > > > > https://git.kernel.org/pub [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t0kqI-0003HM-TW
Subject: Re: [f2fs-dev] [PATCH v5] f2fs: introduce device aliasing file
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Daeho Jeong <daehojeong@google.com>, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/14, Christoph Hellwig wrote:
> On Mon, Oct 14, 2024 at 04:42:07PM +0000, Jaegeuk Kim wrote:
> > > 
> > > Plz, refer to this patch and the description there.
> > > 
> > > https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/commit/?h=dev-test&id=8cc4e257ec20bee207bb034d5ac406e1ab31eaea
> > 
> > Also, I added this in the description.
> > 
> > ---
> >     For example,
> >     "mkfs.f2fs -c /dev/block/test@test_alias /dev/block/main" gives
> >     a file $root/test_alias which carves out /dev/block/test partition.
> 
> What partition?
> 
> So mkfs.f2fs adds additional devices based on the man page.
> 
> So the above creates a file system with two devices, but the second
> device is not added to the general space pool, but mapped to a specific
> file?  How does this file work.  I guess it can't be unlinked and
> renamed.  It probably also can't be truncated and hole punched,
> or use insert/collapse range.  How does the user find out about this
> magic file?  What is the use case?  Are the exact semantics documented
> somewhere?

Let me ask for putting some design in Documentation. Just for a quick reference,
the use-case looks like:

# ls /dev/vd*
/dev/vdb (32GB) /dev/vdc (32GB)
# mkfs.ext4 /dev/vdc
# mkfs.f2fs -c /dev/vdc@vdc.file /dev/vdb
# mount /dev/vdb /mnt/f2fs
# ls -l /mnt/f2fs
vdc.file
# df -h
/dev/vdb                            64G   33G   32G  52% /mnt/f2fs

# mount -o loop /dev/vdc /mnt/ext4
# df -h
/dev/vdb                            64G   33G   32G  52% /mnt/f2fs
/dev/loop7                          32G   24K   30G   1% /mnt/ext4
# umount /mnt/ext4

# f2fs_io getflags /mnt/f2fs/vdc.file 
get a flag on /mnt/f2fs/vdc.file ret=0, flags=nocow(pinned),immutable
# f2fs_io setflags noimmutable /mnt/f2fs/vdc.file
get a flag on noimmutable ret=0, flags=800010
set a flag on /mnt/f2fs/vdc.file ret=0, flags=noimmutable
# rm /mnt/f2fs/vdc.file
# df -h
/dev/vdb                            64G  753M   64G   2% /mnt/f2fs

So, key idea is, user can do any file operations on /dev/vdc, and
reclaim the space after the use, while the space is counted as /data.
That doesn't require modifying partition size and filesystem format.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
