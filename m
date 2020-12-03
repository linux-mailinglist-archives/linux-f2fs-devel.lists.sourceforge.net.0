Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A319F2CE335
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Dec 2020 00:57:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=geT4ZkyKb60l6dxrPbvtaX2R1Yyql/asUEMd6XOc0Ao=; b=hsLoh1pZM1+mbEdEXWXcA4QMC
	3wJlr+pplZ2ca3N1/aN87DcZxxqemytl3a/01MLPT/zEg2tYfCKfR3iZ6d6XU9OXIGM6DH9SK1kqq
	hlOPKsyAyIdlMgPunetw7SZreLSPg/aBEd7wcLtNN+5TBKrF2IUSmDgyFlkAXL2lfnHQQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkyTt-0008Nv-87; Thu, 03 Dec 2020 23:57:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <satyat@google.com>) id 1kkyTn-0008Nc-0N
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 23:57:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r3iPhcdxqx2nLoy8M4vQlPfXI0ncDfSnm735uhVf2l4=; b=ZVV1KI578ZPgQITTZNJpbS3QxK
 HRGcAdzg32j/DSyLHqccrcX0T8/s6WAGtqCfHgg2svAYcj4ituofMxMYS8Pi1j4NX0VHLt+0h4DqR
 kulwrvC1NeU6UoO9+4UFwjUkI/VsYluBtkVo4YiEvCjCjkt6BngXpCCU/h4QbvRKcvRM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r3iPhcdxqx2nLoy8M4vQlPfXI0ncDfSnm735uhVf2l4=; b=BPPpEmuEh7bKvq97IDppwX5OD7
 AKQ+evCdOSOLcygJsjPaL8E1i0mbobwskANEYJ90pHRuig7KGHsUHtTPtR6y6unVhil+FhLXR1YP7
 Q7idML/KiEXSwv4BNTO8cp/Da+23jLBFqDT6VXjgcdyTLgpZlf9bIU12XT0Ss2+3eRtc=;
Received: from mail-pl1-f193.google.com ([209.85.214.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kkyTi-000sn8-3s
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 23:57:42 +0000
Received: by mail-pl1-f193.google.com with SMTP id s2so2080952plr.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 03 Dec 2020 15:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=r3iPhcdxqx2nLoy8M4vQlPfXI0ncDfSnm735uhVf2l4=;
 b=d/iGiH3bSWJT1Ok5lWKWHJazX8nRtciZ2SkqFh9sl21toJzUW3UCNhveT2aQoj8ogX
 t8QbwYZcTOMwT9M0ATD7aMBq57xHvZ7nJiVMEg3iEVnQTpCHlkNcA7YXikSh4EnjqcWB
 stzhhr9yJFM5pdjrLS5OWbEUCKgdH29INZ2zyjE9xeUW1FcIhd4Q4iL/Nw/f2/GACHgg
 aDvQXBk87ZODzpcpMKE0pHui+1uEyo2klybaJRW6e4JiWbP1cTiTkrjTlZ3NjpWie3B3
 x/eCp8DtTgOmUW9I+63inDoSSbf7/2l1mfqTeH2KsYFmct06Vi5iCwJMCrjqpL36/MTJ
 o1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=r3iPhcdxqx2nLoy8M4vQlPfXI0ncDfSnm735uhVf2l4=;
 b=ZBX+nHUizNyrGyqBBDeqV9o3RrWCVUyFEiaC9lGIIOuLXiD6Kyzx5u+T+FuF2347QD
 6nu6ElLa5mPsKnZl5zqxePjZ1+019Ick6VFxSX5UqF26Mvpcqq8Ctc1AaW1zZIxl0Gm3
 oLVfiqATPO3jtohzoIRLFFs0QBfsjhA9HwEMp0r7LKNWDQ6SZUJ87wH9leysZaQ2tnVK
 fMPCR5+8LtbqfK1wB6xqHUJ44xaYInlBtxAlB/F4WBtjYhU7s6LbPZAzX29O7SNMHMaG
 h4aIGtp6NnEOTk1F3gWh7ySOcLMdut8BM1DOMs/yI1XfggGbcgNoOunCihxXgGRG/XUr
 PKqg==
X-Gm-Message-State: AOAM5330U0Kzw7j3V3STI88v1Upg8yR833OKVg3uueRkjSTSueNQ4Yks
 mdebgvA8B4lwSQLKlK2oef46Cg==
X-Google-Smtp-Source: ABdhPJzNGZB0k9vwg17W0yzDJC60tNxzVr36GnJUcQmz8GR8UJ0qGwRTf4QVg019AhXRMWmMtQBlhw==
X-Received: by 2002:a17:90b:4c41:: with SMTP id
 np1mr1449158pjb.186.1607039843547; 
 Thu, 03 Dec 2020 15:57:23 -0800 (PST)
Received: from google.com (154.137.233.35.bc.googleusercontent.com.
 [35.233.137.154])
 by smtp.gmail.com with ESMTPSA id q23sm2903613pfg.18.2020.12.03.15.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 15:57:22 -0800 (PST)
Date: Thu, 3 Dec 2020 23:57:18 +0000
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Message-ID: <X8l7XgWNz5sO/LQ6@google.com>
References: <20201117140708.1068688-1-satyat@google.com>
 <20201117171526.GD445084@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117171526.GD445084@mit.edu>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FSL_HELO_FAKE          No description available.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.193 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.193 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kkyTi-000sn8-3s
Subject: Re: [f2fs-dev] [PATCH v7 0/8] add support for direct I/O with
 fscrypt using blk-crypto
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-xfs@vger.kernel.org,
 "Darrick J . Wong" <darrick.wong@oracle.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-block@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Nov 17, 2020 at 12:15:26PM -0500, Theodore Y. Ts'o wrote:
> What is the expected use case for Direct I/O using fscrypt?  This
> isn't a problem which is unique to fscrypt, but one of the really
> unfortunate aspects of the DIO interface is the silent fallback to
> buffered I/O.  We've lived with this because DIO goes back decades,
> and the original use case was to keep enterprise databases happy, and
> the rules around what is necessary for DIO to work was relatively well
> understood.
> 
> But with fscrypt, there's going to be some additional requirements
> (e.g., using inline crypto) required or else DIO silently fall back to
> buffered I/O for encrypted files.  Depending on the intended use case
> of DIO with fscrypt, this caveat might or might not be unfortunately
> surprising for applications.
> 
> I wonder if we should have some kind of interface so we can more
> explicitly allow applications to query exactly what the requirements
> might be for a particular file vis-a-vis Direct I/O.  What are the
> memory alignment requirements, what are the file offset alignment
> requirements, what are the write size requirements, for a particular
> file.
> 
(Credit to Eric for the description of use cases that I'm
copying/summarizing here).
The primary motivation for this patch series is Android - some devices use
zram with cold page writeback enabled to an encrypted swap file, so direct
I/O is needed to avoid double-caching the data in the swap file. In
general, this patch is useful for avoiding double caching any time a
loopback device is created in an encrypted directory. We also expect this
to be useful for databases that want to use direct I/O but also want to
encrypt data at the FS level.

I do think having a good way to tell userspace about the DIO requirements
would be great to have. Userspace does have ways to access to most, but not
all, of the information it needs to figure out the DIO requirements (I
don't think userspace has any way of figuring out if inline encryption
hardware is available right now), so it would be nice if there was a
good/unified API for getting those requirements.

Do you think we'll need that before these patches can go in though? I do
think the patches as is are useful for their primary use case even without
the ability to explicitly query for the DIO requirements, because Android
devices are predictable w.r.t inline encryption support (devices ship with
either blk-crypto-fallback or have inline encryption hardware, and the
patchset's requirements are met in either case). And even when used on
machines without such predictability, this patch is at worst the same as
the current situation, and at best an improvement.
> 						- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
