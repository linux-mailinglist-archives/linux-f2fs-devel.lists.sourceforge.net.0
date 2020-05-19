Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BCB1D9CD5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 May 2020 18:33:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TMaStqemGxNCDcWPdAI/P22TuLO1NhXRxwocXELXP4o=; b=CAEICwNzNZb5MrQNdwGWEkGGSJ
	ZgAt8hGaWnaJoMN8CXdBUFzYeB6ybYu75VkvQk/EKQyqO4ZxZJddHmOo2PEqRF/2VcgJuO5lpGOcS
	/4OOBQWSeVn8oTZLvaaZcq5EYOxNrd8bTUsQbtwdwWH5uxOqFz9A6HyFQgnZaAjzg9aU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jb5BS-0004ws-8t; Tue, 19 May 2020 16:33:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <paulcrowley@google.com>) id 1jb5BM-0004wT-B6
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 May 2020 16:33:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2FsHvUk8dZh0ajzB3TiumDfxSGd35hr/R1OCXsEMaZA=; b=Ba3snsdsIsHx+D44TpJ1EM4EBO
 czW9GOq9KgBrvaVhA+EDFtEI8T7ObObpqCztiVg8u8ADE3LlenA2CRpw3wVxvoy8i4sgy4Gw+XchX
 eHC8FUkn6tMOPmvp5tqjvTW8SnCOq/QLZ0Jh3ogarb87NWx0bBGlIXWecppwhEYbhWH8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2FsHvUk8dZh0ajzB3TiumDfxSGd35hr/R1OCXsEMaZA=; b=Xd3Vos/1C1UrabCu2bivvZWgGc
 SOXFsyLWCkV70lefg8swcoFqfKTaR5VsdEktohpPmAEQ9Qk1dAXJKPw8z0d+Qds3ETnj+rZjOVHBz
 AXZbQsDj7NzSLP9X57XAMI6wfhCUg6x2DBfcRkYUxO5lO2IaXoroHdBXtEq8jpy6Byhk=;
Received: from mail-lj1-f196.google.com ([209.85.208.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jb5BJ-007bnS-J8
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 May 2020 16:33:30 +0000
Received: by mail-lj1-f196.google.com with SMTP id q2so377828ljm.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 19 May 2020 09:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2FsHvUk8dZh0ajzB3TiumDfxSGd35hr/R1OCXsEMaZA=;
 b=OuDq+uZ2QpYJRvb/GeO+A1uwQ5ZGVdYpPQNakARsRaC0tVz+Y2WhHx7QO92kh4zmEo
 hat1wqnZozmWrQqBpNGDXrYSjHetfvdRerSP00yzpoJpdWsHDdybi1TPyV469jMT2/Bw
 w//6XEQgmwhX2rpK8Bf14xhWiiSsMzArs41dJIB6inPZ7k1okxBmAkm0cZzYn+8s0AtU
 ISUd/6VByWUaIMiDlQ9ds+3/hneGNiP/6Ef4pq7a7WYas/7HaOxqm7ITPmJ30VyOO4SE
 4cgiZVpPS9Y9QZcQhRloXVF0GMXP0p/5dX55Zve9rXXG/f4/yxiZvpTshzXuKEgWJSTA
 +jNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2FsHvUk8dZh0ajzB3TiumDfxSGd35hr/R1OCXsEMaZA=;
 b=R229ahR9QcRX/SdKcZcSItxsIB5fYDfcF1ofJK1JDgubSn00sG+oidRYyxpkzY3uJg
 uAlAnKaznuZ+4hnwwnLWPjM4OZtLUx3dDTPqO6GhXqwRs8OQKKTvEX9ScmYe6KcGt0aJ
 RZ7vZOSLySUTUQwPNru93BLtI9KPQPz7mNnQiO7Z1oyck/trn8CWBG/8NO3QibYR+W1G
 QF7T8b/i57cJJrCPkwphpggXqQtUHBAjSNsq/tHLBuAo7kkNUrwfBRuqws3pjCdvUXSo
 kTU/pFZF2emcKMNMXndqjnqpv8e3sa/bzK4SKupSmu6+8zn0kQuPngloBYoDFlXcw4KQ
 3pMA==
X-Gm-Message-State: AOAM533NvZMerECKdoV+egZdnO+MdbaayccuUOk7o81FHkz1udvjPFWX
 8UnO99jzhzvC0+hckWI2wP6H2XqGfh8OhHiFeuYhq8s/
X-Google-Smtp-Source: ABdhPJwPMZ+B//q1l+gspCxSvYAD5mGiFN9/ycCKeAsnEVod6dS23lZ1SlsTQnf1ToCfRRMuXDUo8D2W9i0it03SfwM=
X-Received: by 2002:a05:651c:3c6:: with SMTP id
 f6mr179097ljp.138.1589906002547; 
 Tue, 19 May 2020 09:33:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200515204141.251098-1-ebiggers@kernel.org>
In-Reply-To: <20200515204141.251098-1-ebiggers@kernel.org>
Date: Tue, 19 May 2020 09:33:11 -0700
Message-ID: <CA+_SqcB09GJJoTBm-U7ZwyTjuumyp4QwhLyxj8wbObd47qJOWw@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.196 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.196 listed in list.dnswl.org]
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1jb5BJ-007bnS-J8
Subject: Re: [f2fs-dev] [PATCH] fscrypt: add support for IV_INO_LBLK_32
 policies
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
From: Paul Crowley via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Paul Crowley <paulcrowley@google.com>
Cc: Satya Tangirala <satyat@google.com>, "Theodore Y . Ts'o" <tytso@mit.edu>,
 linux-mmc@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, 15 May 2020 at 13:50, Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> The eMMC inline crypto standard will only specify 32 DUN bits (a.k.a. IV
> bits), unlike UFS's 64.  IV_INO_LBLK_64 is therefore not applicable, but
> an encryption format which uses one key per policy and permits the
> moving of encrypted file contents (as f2fs's garbage collector requires)
> is still desirable.
>
> To support such hardware, add a new encryption format IV_INO_LBLK_32
> that makes the best use of the 32 bits: the IV is set to
> 'SipHash-2-4(inode_number) + file_logical_block_number mod 2^32', where
> the SipHash key is derived from the fscrypt master key.  We hash only
> the inode number and not also the block number, because we need to
> maintain contiguity of DUNs to merge bios.

Reviewed-by: Paul Crowley <paulcrowley@google.com>

This is the best that can be done cryptographically on such hardware.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
