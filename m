Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 982A71ED4D8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Jun 2020 19:18:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jgX21-0003xb-Fi; Wed, 03 Jun 2020 17:18:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jgX20-0003xQ-9X
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Jun 2020 17:18:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1egX75OTSc8gl4Ix9wEOWDIMVRohP+UCxLzTJrhMqS4=; b=aZsVrSjYI/eAER2X1+EUMZq4nK
 d+K124tbKXpXu6ESjxXjNnzUQt6k/kuqfURrwL6ZKSltp07QrfuwG1b1endjKc1VxjkXH7wOkN1FS
 O8sxjyoQnHtEUmLFh0JvZ03jlUcJqvYJHbzeNHqKFlKY5xgP8ijtvuAznveSi1bAaiQg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1egX75OTSc8gl4Ix9wEOWDIMVRohP+UCxLzTJrhMqS4=; b=EvbKIDz6aJH+ZS6d11wgBJ+q1F
 pWuZY55ozLNIiHQSF0unP3D8JrG3h93pHttqCaiTGNQikOUBJiEipmIoLs2jFBstniJVggCDTcQgU
 pRXErZTGiIcm6U3cJrVcb7UWKqEPIHEK97n49m4t16UDMPL4GxWQQ6U8ukOnCSu7DNaw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jgX1z-007epH-1q
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Jun 2020 17:18:24 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C313F20674;
 Wed,  3 Jun 2020 17:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591204696;
 bh=uFsQ+xatR1duoVChFNaX6PpeFlygU+I7Nm7Rbpg+QDA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QpLfRHyOCodIaWjb+6xbwhYMOZ4zGgYKB3TU9G4CBgBGdBFvb9sYC0tWyyUOp5jj2
 xEN1ZtUGjIT8+TtDdGA3NtY1YNYFy3BI8csnRWl02f0goKiJLNsuid14BvdwFADjaP
 n3Aksc5IgoG5YPHv/D5aKmEfsS7OPvg8+T+oHV40=
Date: Wed, 3 Jun 2020 10:18:16 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Hongwei <glqhw@qq.com>
Message-ID: <20200603171816.GC85814@google.com>
References: <tencent_DCCAEE9137D2150CB266BD2CF3EDF98A970A@qq.com>
 <20200528172606.GA153385@google.com>
 <tencent_2E2E902BD0A10D8A67C92DE7EC6D887BCB0A@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_2E2E902BD0A10D8A67C92DE7EC6D887BCB0A@qq.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jgX1z-007epH-1q
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

Hi Hongwei,

On 05/29, Hongwei wrote:
> Hi,
> >On 05/28, Hongwei wrote:
> >> Hi F2FS experts,
> >> As written in f2fs_do_sync_file():
> >> "Both of fdatasync() and fsync() are able to be recovered from sudden-power-off."
> >>
> >> Please consider this workflow:
> >> 1. Start atomic write
> >> 2. Multiple file writes
> >> 3. Commit atomic write
> >> 4. fdatasync()
> >> 5. Powerloss.
> >>
> >> In the 4th step, the fdatasync() doesn't wait for node writeback.
> >> So we may loss node blocks after powerloss.
> >>
> >> If the data blocks are persisted but node blocks aren't, can the recovery program recover the transaction?
> >
> >#3 will guarantee the blocks written by #2. So, if there's no written between #3
> >and #4, I think we have nothing to recover.
> >Does this make sense to you?
> 
> Thanks for your reply. Please consider this:
> f2fs_do_sync_file() doesn't wait for node writeback if atomic==1. So it is possible that after #3, node is still writing back.
> #4 fdatasync() doesn't wait for node write back either.
> Considering node writeback BIO is flagged with PREFLUSH and FUA, it may take a long time to complete.
> Therefore, when #5 power failure happens, it is possible that the node block is not persisted?
> If I was correct about this, can the recovery program recover the transaction?

I see. That can be the issue tho, is there a real usecase for this? I mean,
given atomic writes by sqlite, next transaction will be also serialized with
another atomic writes, which we could bypass waiting node writes.

Thanks,

> 
> >
> >>
> >> Thanks!
> >>
> >> Hongwei
> >> _______________________________________________
> >> Linux-f2fs-devel mailing list
> >> Linux-f2fs-devel@lists.sourceforge.net
> >> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
