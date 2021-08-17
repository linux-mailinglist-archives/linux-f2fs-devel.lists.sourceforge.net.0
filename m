Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 588773EF25C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Aug 2021 20:58:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mG4IB-00083G-45; Tue, 17 Aug 2021 18:58:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1mG4I9-00082p-Vz
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Aug 2021 18:58:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DVgNcP4DW59ZFm2UfKXZMQqjoRegf7SSq51IkB9Pcz0=; b=XNHqkq8YRUpxvFrldMDVKenins
 5uv4doOCb5TodJa2pEwqmtbRrtJeCn0rpuvWMPZyVNnER3aHp+BGJC25FGPk2wox3pHEe5lWlXmab
 fAVBO5L6eQB1+1HrjXHp6GPx2IWxE8bkKm9UxsEwzWwt8Bnce65ui/bB+biJbRmXIGZM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DVgNcP4DW59ZFm2UfKXZMQqjoRegf7SSq51IkB9Pcz0=; b=ZwgBV6FWJCo8RQvA9JgyrWaOB2
 z04aLE3Y04/EEVDOnFsrhrQUhzEETvzG/JZdjso0zsClNDUPoDtrLq07YUzvLf5PaDVAKhLvUEJ8d
 ubeDPGi0+c1D9s4KE7QuGo5RAWhwFqN8UigUXv2KNmU3qwqp8n5KE6LRNW50AmLHpiro=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mG4I6-0005GE-Ax
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Aug 2021 18:58:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8DE7760F58;
 Tue, 17 Aug 2021 18:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629226700;
 bh=ybaZbjhb4qySD5Pozoo9NhCNuXsZVugnMPJsjSKrOCY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m0P3cKpuhO9EctIoSSNch6haKgcVwZt4U5J7EXvYDjh1v8s01YX/GyvJTlEHRkZrS
 aVAh7Louv167R4nOckHL0xgW4rxxGYwl8kwe6blRCTzl7BJuQmFZBIk9YjkRLjz31s
 hFXpkRxyjmWfbXnP232R6aiFkDWaghm544XLUl2cCBkkz/HnVAXX2/NGjka1BvSL1T
 W1lQGqn5qVIU0XTcjWD13027xeGTAqE9Kp9IiGz4VUIyCABLbykBg1vflsP4A6wg8h
 MJNKuvgYgBaKYL6vsKpjIA8GlN0rYlJDncWPxgjwAWF2FlglMzm7P9XGJZiE5gxb4f
 aUVi8j7kqyj9Q==
Date: Tue, 17 Aug 2021 11:58:19 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Message-ID: <YRwGyzZn+vxRoXTO@google.com>
References: <20210816234247.139528-1-nathan@kernel.org>
 <YRsD6P4x9v38oDWl@google.com>
 <1f2eff07-f003-03c8-b3c8-0e06f9bf9684@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1f2eff07-f003-03c8-b3c8-0e06f9bf9684@kernel.org>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mG4I6-0005GE-Ax
Subject: Re: [f2fs-dev] [PATCH] f2fs: Add missing inline to
 f2fs_sanity_check_cluster() stub
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/16, Nathan Chancellor wrote:
> On 8/16/2021 5:33 PM, Jaegeuk Kim wrote:
> > Hi Nathan,
> > 
> > On 08/16, Nathan Chancellor wrote:
> > > Without this, there is a warning in nearly every fs/f2fs/ file when
> > > F2FS_FS_COMPRESSION is not set:
> > > 
> > > In file included from fs/f2fs/super.c:31:
> > > fs/f2fs/f2fs.h:4251:13: warning: unused function 'f2fs_sanity_check_cluster' [-Wunused-function]
> > > static bool f2fs_sanity_check_cluster(struct dnode_of_data *dn) { return false; }
> > >              ^
> > > 1 warning generated.
> > > 
> > > Fixes: 1495870233e7 ("f2fs: compress: do sanity check on cluster")
> > 
> > This has not been merged yet, so if you don't mind, can I integrate your fix in
> > the original patch?
> 
> Sure thing!

Thanks~ :)

> 
> Cheers,
> Nathan


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
