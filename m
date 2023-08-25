Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4A7789200
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 26 Aug 2023 00:53:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZfgR-0001XH-A7;
	Fri, 25 Aug 2023 22:53:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@fromorbit.com>) id 1qZfgQ-0001XA-DP
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 22:53:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pUz0mvDJOC9uQjgg5Uba361PK/6ticcfnjAOo3qTtYA=; b=hQtKEN5jBHfJUAhIEmsldMaucq
 ZwuszvgZf9PMxyKtv7biFQBoQr2iM26h0GHq4lF3+nk22mlRIHu6sQ62f5irINigLHIZop/+qhciP
 o51mCXtb40gH23CJmq+jJ80SKWyebOyn1UifT6Il8lMGzDUF9XIk/tZCX6U3+xdZl5KY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pUz0mvDJOC9uQjgg5Uba361PK/6ticcfnjAOo3qTtYA=; b=hEnqEnFGgnFheB0H4lFoEp5Cvv
 MmOGaXR0UycKkTPChdbA5JCEOXx3GAxn7ocrNSrPolthzgjL/Rw2Uv2c67DA2nEHz7mNDLqSDHkwx
 Iz+eRW57txm2AzNlcTLM6edbM2YmECO8rM/6t5Ci8lCXnovlSMXOnG1EQBDADx+Ed470=;
Received: from mail-pf1-f177.google.com ([209.85.210.177])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qZfgP-00Fcf8-MA for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 22:53:38 +0000
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-68c0d4cc3a4so714034b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 25 Aug 2023 15:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20221208.gappssmtp.com; s=20221208; t=1693004012; x=1693608812;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pUz0mvDJOC9uQjgg5Uba361PK/6ticcfnjAOo3qTtYA=;
 b=F6apRE+SrZTqCeuN1zLMRosK5ge3rhNKZnpOWKEqEdWDSsGDK7EQGyDQsb6/5NjMZA
 3YMPbcTJ/D3BMiY5oD/xtnLm9pzhShZ6+Y7oDMWnO0DfFEZbieWLXokCpFNjeT5nfH1C
 s22NB1Wf7ErFiXowqbOOitIpN8YQ6wn+7f9hHAh/AXrGUdDwlOs/O2qrqcuv4RSpXcnU
 GbrxFepvZAk5VQgoyCmH+APqoM+wo3KvR0eb+zB1BsLvnPOQaJNrJEZsuvoY9FN/6wnP
 PBrjyNBdKOdo0Hj7mZUOQ9904vJZldE2dQql827LKN+udL2AKxU33q1Q1ADVqqMaFs/v
 qugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693004012; x=1693608812;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pUz0mvDJOC9uQjgg5Uba361PK/6ticcfnjAOo3qTtYA=;
 b=Wfzl2YXpwj7TNKl+S9ojyY48nOWHFpcJm3U5XsZrUn9CYsBA2gypZvmfxW/OJkc0Ua
 J2M1o8aHf6EG61KOFrJOR5343jnBnXdHbs51RxwkfhU63raDkUKf1aUk5BoK4+Ii6ukk
 jWO6e1FhUKYCVugX/ICyW4vSdE3XTPIdxiW7TKAEFTrQtaYB3d1Rpjwloi24SLSHpiQ1
 AecPuPovUQliJrNG1qfMgHyrDDlQP3WycRhrTh0/E/RNzD8LvH+GHI2+AMw5fGNah43j
 rcbdpgSmFz2tcsNK+yLjUjh1SR3jIOjSyYRB/kMXo667wGa5E4NW0cI0bu2r2WrlW1b/
 N2Zg==
X-Gm-Message-State: AOJu0Yx1a0t+ZyBFx5pLG7ZuyFeINJaym3LXSNuTwtMOYa8fSUi7GWmb
 vfOTZHQAp/2uqpwa1sOREHS27A==
X-Google-Smtp-Source: AGHT+IF7qLruqklxY40yAH4SKvsJCnFBTQ8pg1x9p8DXB9ryPTSvbA4aGhPPBTQdBXYgxxyeFGZdhA==
X-Received: by 2002:a05:6a20:7354:b0:13d:5b8e:db83 with SMTP id
 v20-20020a056a20735400b0013d5b8edb83mr20399311pzc.9.1693004012072; 
 Fri, 25 Aug 2023 15:53:32 -0700 (PDT)
Received: from dread.disaster.area (pa49-195-66-88.pa.nsw.optusnet.com.au.
 [49.195.66.88]) by smtp.gmail.com with ESMTPSA id
 u15-20020a62ed0f000000b006887be16675sm2060364pfh.205.2023.08.25.15.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 15:53:31 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
 (envelope-from <david@fromorbit.com>) id 1qZfgG-006WDY-1c;
 Sat, 26 Aug 2023 08:53:28 +1000
Date: Sat, 26 Aug 2023 08:53:28 +1000
To: Hao Xu <hao.xu@linux.dev>
Message-ID: <ZOkw6KkdP1UWPNBW@dread.disaster.area>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230825135431.1317785-1-hao.xu@linux.dev>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Aug 25, 2023 at 09:54:02PM +0800, Hao Xu wrote: >
 From: Hao Xu <howeyxu@tencent.com> > > This series introduce getdents64 to
 io_uring, the code logic is similar > with the snychronized version [...]
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.177 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.177 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qZfgP-00Fcf8-MA
Subject: Re: [f2fs-dev] [PATCH RFC v5 00/29] io_uring getdents
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
From: Dave Chinner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Dave Chinner <david@fromorbit.com>
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-cachefs@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 netdev@vger.kernel.org, samba-technical@lists.samba.org,
 linux-unionfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, bpf@vger.kernel.org,
 Pavel Begunkov <asml.silence@gmail.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Aug 25, 2023 at 09:54:02PM +0800, Hao Xu wrote:
> From: Hao Xu <howeyxu@tencent.com>
> 
> This series introduce getdents64 to io_uring, the code logic is similar
> with the snychronized version's. It first try nowait issue, and offload
> it to io-wq threads if the first try fails.
> 
> Patch1 and Patch2 are some preparation
> Patch3 supports nowait for xfs getdents code
> Patch4-11 are vfs change, include adding helpers and trylock for locks
> Patch12-29 supports nowait for involved xfs journal stuff
> note, Patch24 and 27 are actually two questions, might be removed later.
> an xfs test may come later.

You need to drop all the XFS journal stuff. It's fundamentally
broken as it stands, and we cannot support non-blocking
transactional changes without first putting a massive investment in
transaction and intent chain rollback to allow correctly undoing
partially complete modifications.

Regardless, non-blocking transactions are completely unnecessary for
a non-blocking readdir implementation. readdir should only be
touching atime, and with relatime it should only occur once every 24
hours per inode. If that's a problem, then we have noatime mount
options. Hence I just don't see any point in worrying about having a
timestamp update block occasionally...

I also don't really don't see why you need to fiddle with xfs buffer
cache semantics - it already has the functionality "nowait" buffer
reads require (i.e.  XBF_INCORE|XBF_TRYLOCK).

However, the readahead IO that the xfs readdir code issues cannot
use your defined NOWAIT semantics - it must be able to allocate
memory and issue IO. Readahead already avoids blocking on memory
allocation and blocking on IO via the XBF_READ_AHEAD flag. This sets
__GFP_NORETRY for buffer allocation and REQ_RAHEAD for IO. Hence
readahead only needs the existing XBF_TRYLOCK flag to be set to be
compatible with the required NOWAIT semantics....

As for the NOIO memory allocation restrictions io_uring requires,
that should be enforced at the io_uring layer before calling into
the VFS using memalloc_noio_save/restore.  At that point no memory
allocation will trigger IO and none of the code running under NOWAIT
conditions even needs to be aware that io_uring has a GFP_NOIO
restriction on memory allocation....

Please go back to the simple "do non-blocking buffer IO"
implementation we started with and don't try to solve every little
blocking problem that might exist in the VFS and filesystems...

-Dave
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
