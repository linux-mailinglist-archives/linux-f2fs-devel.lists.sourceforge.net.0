Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E30A01EF047
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 Jun 2020 06:20:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jh3pr-0003lw-7Q; Fri, 05 Jun 2020 04:20:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <glqinhongwei@gmail.com>) id 1jh3pq-0003lp-9l
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Jun 2020 04:20:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jp+yfNFWOIl4uQBqwChPrhefWJhAJ5btPJpWrc8BpGg=; b=H+r2QuxADpWnhU26tNG/uLHCGC
 Bn2GbbdAxR2QBYQbBgFHw31bceMLRd+m4swwGH+8zRDMUenZzry90ScxDnM6Asgb/spOW+ahhJGwb
 EOH4l7vAFtIqEyBrkG0ln3Bw0TQsZTrzXmA35MSE42QeGbQSgaSbzdZgaiW5m+nsFc7w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jp+yfNFWOIl4uQBqwChPrhefWJhAJ5btPJpWrc8BpGg=; b=lCkAuNwMwulW/M8Z5HklneqVKJ
 TZuFMHSB0v6wTA0kcR8W/ZXNMCjZGdyvf68i404gYvahVEaCf0+qGr2vBLZuozI4unLeVUbBOixTH
 RZ0DKUzumzTsmeoqxnwpWI6rWdmQExtA3bGsDHREJaNPg107HFAqajdbSQtZ6pM9OFMs=;
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jh3pm-00CPWA-OR
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Jun 2020 04:20:02 +0000
Received: by mail-io1-f68.google.com with SMTP id r2so8853508ioo.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 04 Jun 2020 21:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jp+yfNFWOIl4uQBqwChPrhefWJhAJ5btPJpWrc8BpGg=;
 b=YsrTWyWb6nwuT9HRtYwxh9FNaKgvsBPQVDfv5r3Fb6GrzL1sifTDZeRIvX1sDMJk81
 KYrr/xZce49LiAWWOlYxKrZNtfEVrsdb9SlvgZSjV6Vpu5m3F6Cv5f0Lc370bRTRao6l
 RwlBitWZFk1c9boqk1o59S4pDDIVhigRclVMDAS52R6OPjhGi2q4P+TLUPbRK2s0eQAu
 Apr94AjQgX3/AwId1GbPQn+Bu9t43jg7z7zol7PwaCpWvBRfTbWGZinpBqKnQS7ld3oB
 mquVC7CYWocJAqSGQcfftMlzSzMVqKLFAeIvLIQNhbKZhGcUnfe9aack8s4XDgx1YBJS
 yGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jp+yfNFWOIl4uQBqwChPrhefWJhAJ5btPJpWrc8BpGg=;
 b=YfajgJvMAwoSYEVTyP1iKiWRHZRWfhq4jc3yij0E6lUauL+zXLMHnpmXJUyce3//G8
 kTrezxAYa1d3+x0S6hQMBvB9jDD6c7WC2SVvhLVf5d/OsTQb8A/nv73P9iTvJX5P0Ik9
 CPgd8JLriXCsLZ2t2HNZbHdP/Q8gmM0v9svPnkZ3hame3ymnkGvlRm+QUmcBqyJeJZ4Y
 LIo44Zh8bBgiObq6nMMJT5q6+ioAhc0kkSYq4MjhvPQRcK7WVtU0BLkRrL6JYgJwwTpN
 28eYV07G0OKhKmR8IGuaeGVsgbq2W/Nu0vQLRu5O96ZUeI/9WhbkHap3/1Z+sr0KnBDA
 6/ug==
X-Gm-Message-State: AOAM5310Y8TRs2Y+y9gBv4mr78di4JyxAu25hlavVgJ8fL9KCi/RyHT9
 bto/Lr8I6+PeEMItQpm3/k4GFSAdysnt1LeiYCwnbPB5UkY=
X-Google-Smtp-Source: ABdhPJxPlwEBg3xf10SWYbod1zHVpibE2b53eOC2GMutnD+KbsID/fUT9hM8geohDSW3CcFt20vHEbXsDGHGvzb0FEg=
X-Received: by 2002:a5e:8e47:: with SMTP id r7mr6935555ioo.204.1591330793021; 
 Thu, 04 Jun 2020 21:19:53 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_DCCAEE9137D2150CB266BD2CF3EDF98A970A@qq.com>
 <20200528172606.GA153385@google.com>
 <tencent_2E2E902BD0A10D8A67C92DE7EC6D887BCB0A@qq.com>
 <20200603171816.GC85814@google.com>
 <CAKvRR0QjB8u-MnG7om5skFAg_y68vb5b2jjL-VdMOFhHcKqc2g@mail.gmail.com>
 <20200604161332.GA187121@google.com>
In-Reply-To: <20200604161332.GA187121@google.com>
From: Hongwei Qin <glqinhongwei@gmail.com>
Date: Fri, 5 Jun 2020 12:19:42 +0800
Message-ID: <CAKvRR0ShV8mJdEZHTiy0=qQ3xHSMkq3-NMh5FqJ4_82TFCJq6g@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (glqinhongwei[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.68 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.68 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jh3pm-00CPWA-OR
Subject: Re: [f2fs-dev] Can F2FS roll forward after fdatasync()?
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
Cc: linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> It's a bit unclear to me. Do you want to add fsync/fdatasync 1) in SQLite, or
> 2) in your test program after transaction?
>
> 1) You'd better to build SQLite without atomic write.
> 2) I think you don't need to do that, since SQLite should guarantee the
>    durability.
>

It's (1). I want to use fsync/fdatasync in SQLite.
In fact, this is already done in SQLite. If the database is run in
FULL_SYNC mode with atomic_write enabled, SQLite will add an fsync()
after the transaction to enforce durability. When compiling the
SQLite, if we add -DHAVE_FDATASYNC to Makefile cflags, the SQLite will
use fdatasync() instead of fsync().
So I think for strict persistency guarantee, we can still use the
atomic write feature with fsync(). This avoids SQLite journaling
overheads.

> Yes, it can hurt durability a bit logically, but I haven't seen any real problem
> from field. The reason is, let's say power cut happens during last transactions.
> Then, we can actually ask a question like "do we need to recover last moment
> transaction? Moreover, does uesr get noticed?". I may say no, if we can keep the
> order of all the transactions.

Indeed, it's not that necessary.

Thanks for your help and the discussion. :)


On Fri, Jun 5, 2020 at 12:13 AM Jaegeuk Kim <jaegeuk@kernel.org> wrote:
>
> On 06/04, Hongwei Qin wrote:
> > Hi Jaegeuk(if I may),
> >
> > On Thu, Jun 4, 2020 at 1:19 AM Jaegeuk Kim <jaegeuk@kernel.org> wrote:
> > >
> > > Hi Hongwei,
> > >
> > > On 05/29, Hongwei wrote:
> > > > Hi,
> > > > >On 05/28, Hongwei wrote:
> > > > >> Hi F2FS experts,
> > > > >> As written in f2fs_do_sync_file():
> > > > >> "Both of fdatasync() and fsync() are able to be recovered from sudden-power-off."
> > > > >>
> > > > >> Please consider this workflow:
> > > > >> 1. Start atomic write
> > > > >> 2. Multiple file writes
> > > > >> 3. Commit atomic write
> > > > >> 4. fdatasync()
> > > > >> 5. Powerloss.
> > > > >>
> > > > >> In the 4th step, the fdatasync() doesn't wait for node writeback.
> > > > >> So we may loss node blocks after powerloss.
> > > > >>
> > > > >> If the data blocks are persisted but node blocks aren't, can the recovery program recover the transaction?
> > > > >
> > > > >#3 will guarantee the blocks written by #2. So, if there's no written between #3
> > > > >and #4, I think we have nothing to recover.
> > > > >Does this make sense to you?
> > > >
> > > > Thanks for your reply. Please consider this:
> > > > f2fs_do_sync_file() doesn't wait for node writeback if atomic==1. So it is possible that after #3, node is still writing back.
> > > > #4 fdatasync() doesn't wait for node write back either.
> > > > Considering node writeback BIO is flagged with PREFLUSH and FUA, it may take a long time to complete.
> > > > Therefore, when #5 power failure happens, it is possible that the node block is not persisted?
> > > > If I was correct about this, can the recovery program recover the transaction?
> > >
> > > I see. That can be the issue tho, is there a real usecase for this? I mean,
> > > given atomic writes by sqlite, next transaction will be also serialized with
> > > another atomic writes, which we could bypass waiting node writes.
> > >
> >
> > Thanks for your reply. I think the use case is from SQLite.
> > I'm writing an SQLite test program and I need to decide whether to use
> > fdatasync() or fsync() after the F2FS transaction to ensure
> > durability.
> > E.g., if the SQLite receives an INSERT, it needs to ensure the data's
> > persistency before returning the SQL handler.
> > My guess is that in this case, the SQLite needs to use fsync().
>
> It's a bit unclear to me. Do you want to add fsync/fdatasync 1) in SQLite, or
> 2) in your test program after transaction?
>
> 1) You'd better to build SQLite without atomic write.
> 2) I think you don't need to do that, since SQLite should guarantee the
>    durability.
>
> >
> > This further drives me to think that whether we can optimize F2FS so
> > that in this case we can use fdatasync() instead of fsync().
> > My concern is that under current implementation, it is possible that
> > after #4, the data is still volatile (data BIOs are not flagged with
> > FUA so waiting for data page writeback can't guarantee its
> > persistency).
> > Therefore, if we add the FUA flag to data BIOs, maybe we can at lease
> > guarantee that the data blocks are durable after fdatasync()?
> >
> > If all of my understandings are correct, can F2FS roll forward the
> > transaction if all its data blocks are persisted while missing node
> > blocks? (My guess is no because in such case we don't know the file
> > offset of the data blocks)
> >
> > Or, maybe this just doesn't happen in reality?
>
> So, if you want to guarantee all of them very strictly, you can build SQLite
> without atomic write, and set mount option with fsync_mode=posix in f2fs.
> Instead, if you want to improve the performance a bit, you can build SQLite with
> atomic write and fsync_mode=nobarrier in f2fs.
> Yes, it can hurt durability a bit logically, but I haven't seen any real problem
> from field. The reason is, let's say power cut happens during last transactions.
> Then, we can actually ask a question like "do we need to recover last moment
> transaction? Moreover, does uesr get noticed?". I may say no, if we can keep the
> order of all the transactions.
>
> Thanks,
>
> >
> > > Thanks,
> > >
> > > >
> > > > >
> > > > >>
> > > > >> Thanks!
> > > > >>
> > > > >> Hongwei
> > > > >> _______________________________________________
> > > > >> Linux-f2fs-devel mailing list
> > > > >> Linux-f2fs-devel@lists.sourceforge.net
> > > > >> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> > > > _______________________________________________
> > > > Linux-f2fs-devel mailing list
> > > > Linux-f2fs-devel@lists.sourceforge.net
> > > > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> > >
> > >
> > > _______________________________________________
> > > Linux-f2fs-devel mailing list
> > > Linux-f2fs-devel@lists.sourceforge.net
> > > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
