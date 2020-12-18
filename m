Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 487822DDEA7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Dec 2020 07:34:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fFC8Khdh7k2D8rKNzqMWPvBbhvU4KoZqleGQ1Fsame8=; b=Rw2wVXHLfLEvoXB1mQNOlGhXR
	iJmdraFeJWF0KOVTklxOhtJnt4dky6ZIPRCDaUzGZyXGSdtkjpA98V63TxcRyM92iwUod4y6xrhJu
	UaZuRcT1slPGf/fBxpQNF/r5yzeBWbh9Nh56jN6h0WwV1mHGL5+t/V46s0MMtqkh8jNSg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kq9Kz-0004gf-B5; Fri, 18 Dec 2020 06:34:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <satyat@google.com>) id 1kq9Kx-0004gX-Rt
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Dec 2020 06:33:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JTrXy7/MnVNK2lnR9C6MOL7nDVbBWXdPWil7hfPkWL8=; b=Y6ftfgH/pK/srzNRAW97xmDnAg
 UfTKi3YN/1HBb8Q2gMB0U8feUpnvxsTW+Q74ceCQz4uhIB5utCFb7TlfVVp+PGv+49mszJZxnKmHM
 WXKgTI+ZV3nRs09VcM5AQ3dx+24aK66eGfb392ksOvnnYDDJSgbzaABKtBiUC8+jtWAk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JTrXy7/MnVNK2lnR9C6MOL7nDVbBWXdPWil7hfPkWL8=; b=PK5r70BDjiiQ9dDn5fXewt0BoW
 RnwqdOsox1lu3ZqhvF0G4trv8ad4PnboOPuf+Xz+KfCrTC7Jz5EnQFh+5Wopqp/0Dn+AwmtfnV4pQ
 uupVdTjD+ByifyfAkR1B2cIYeMQ4xfzNn7/JnZ06xpevT6LCk2gZto+7a1g7zlFRru00=;
Received: from mail-pl1-f182.google.com ([209.85.214.182])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kq9Kt-0010Wx-VW
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Dec 2020 06:33:59 +0000
Received: by mail-pl1-f182.google.com with SMTP id b8so893064plx.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 17 Dec 2020 22:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JTrXy7/MnVNK2lnR9C6MOL7nDVbBWXdPWil7hfPkWL8=;
 b=nrCpjd81zVH+CpPx1pgFF+HpcvRPah93Nvhhd7rap0wX4esp10X6TcTl4Bnra6eYfV
 bFY/VZhzj3p7t35u5EEO/6Orx/adhCKPF/HczWr8WvZcNOjahdB6mgDRVOeR7yk0/jm+
 xQK8J3iPQ8nh7djsf/rX7CRo7edXIxB+okwckwBlDgphvs4ieMs8ahjxCJnzwvSAhrFr
 lhPn5KrIupW21tK7Sz2uT2txA8dpPrk/GHZzFvCmitp6HX8zzqFc9e5okdwsdibNl6Rj
 Oa2GyhHhJe4pHg193S4YFioMi+okrT6xMDbqgo8ifrki05gCGZEhveGh9oL509QVJ38S
 aVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JTrXy7/MnVNK2lnR9C6MOL7nDVbBWXdPWil7hfPkWL8=;
 b=i6whthrm9CIPRx7rrgVh1cHFjuLLbMjGJAEsOSmas5Wt95HZh6y4IO/ck4tFpaX3iH
 2WGCC7BQqgwVS9/+NKBFMKXLxUFMmw13x3St6h5/vsfY1lPjYWHfDi0h2g5Qyv9qMo+N
 pae26tncuSFgHDW17xtCACM8Y+FSJkmh00fPYtTdpklfkLo8af1ZpZV7U0ZCqGACWvWu
 oe8jwv9uw/mKkEINzgdYokiSQpE+cIbAnESPjUwwR6V8cS2qMoP5a9AOTeldtigY7hbk
 DyV+Z0N4vi/bKJicXcXrEQov7BEjPUibrMRKciTp2WAkoh3RUnjJMJB6+2RbjPrM/swD
 bJ6Q==
X-Gm-Message-State: AOAM532tZi1tjioFHd3mNBRhR/dN/xQQxVCNrXMRssaYjrPDzGf50PeU
 Wn8ztiSl7MtdtLj+DL+jfI4kmg==
X-Google-Smtp-Source: ABdhPJxwRrBcj3p3lXkh/+YFgeQmriNNbJRdS9LCvHGUhTHs9VP9h3TdkfseIZEWGesfS+aYM3SCHw==
X-Received: by 2002:a17:902:850c:b029:da:e4a6:3641 with SMTP id
 bj12-20020a170902850cb02900dae4a63641mr2851381plb.57.1608273230179; 
 Thu, 17 Dec 2020 22:33:50 -0800 (PST)
Received: from google.com (139.60.82.34.bc.googleusercontent.com.
 [34.82.60.139])
 by smtp.gmail.com with ESMTPSA id a22sm7244274pfa.215.2020.12.17.22.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 22:33:49 -0800 (PST)
Date: Fri, 18 Dec 2020 06:33:46 +0000
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <X9xNSiX8emhL3Twc@google.com>
References: <20201217151013.1513045-1-satyat@google.com>
 <20201217151013.1513045-2-satyat@google.com>
 <84319aff-1b78-ecbc-635e-bad990ed5d4e@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <84319aff-1b78-ecbc-635e-bad990ed5d4e@huawei.com>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FSL_HELO_FAKE          No description available.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.182 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.182 listed in wl.mailspike.net]
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
X-Headers-End: 1kq9Kt-0010Wx-VW
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs-tools: Introduce metadata
 encryption support
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
Cc: Eric Biggers <ebiggers@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Dec 18, 2020 at 09:06:00AM +0800, Chao Yu wrote:
> On 2020/12/17 23:10, Satya Tangirala via Linux-f2fs-devel wrote:
> > Introduce native metadata encryption support for f2fs. All blocks
> > other than the super block (and its redundant copy) are encrypted with the
> > specified metadata encryption key and algorithm. The IV for each block is
> > its block number in the filesystem.
> 
> The same question as kernel side patchset, for node block, why not using its
> nid as IV value?
> 
I addressed this on the kernel side patchset too (because
the reason is kernel related) at
https://lore.kernel.org/linux-fscrypt/X9t8y3rElyAPCLoD@google.com/

But in summary, I think using nid as the IV value would have been good
if we had the ability to specify the IV for each data unit in a bio
independently of all the other data units in the bio. However, we can
only specify the DUN of the first data unit in each bio with the
bi_crypt_context, so it's better to make physically contiguous data
units also have contiguous DUNs, which won't be the case if the DUN is
not related to the physical block address (I'm not familiar with nids,
but it sounds like nids are independent of block address).

Does that make sense or is there something I'm missing?

> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
