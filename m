Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD977134AF4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jan 2020 19:50:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oT8/Lv/txkaewwtN/xtClYllbRYv+fAmuDvyyAtQ/i0=; b=IMUcSKhsMkqB7XbW7qB5zKzby
	Lsul6efwv+OD1Suf0feHKeoMFYf7mjQT/lMbB6E7vHtksuZZ7bQ32S+XWUBg/cccDgQX0aipBNtBX
	sszUDCFJw/QsqZ+YBaOQlxqn+p5vkf91EbE9jST5M2vTsLtTBarjzRLwzcV97Apat8f8o=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ipGPr-00039o-Az; Wed, 08 Jan 2020 18:50:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <satyat@google.com>) id 1ipGPp-00039M-Rg
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jan 2020 18:50:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GqM7/Gox89N6RYmX8N+C+JYNDY9Y92t5hXeig9A+0NE=; b=jTZHXNAcd+SZ3gyBpPG8WB1GOh
 SKhaqFGkFaXhbIMfO7ohPdKfrZBneabntu0G1O3nnTE3EnDO6dcLL8deHN6829hr8wC1VRH+pT1zG
 CII6YxA9l850FmSBTCIhY14pB8Fz2yCLfvyHazoFaKh4m/cGJBvY14zuew1iLG9lqPyI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GqM7/Gox89N6RYmX8N+C+JYNDY9Y92t5hXeig9A+0NE=; b=lJlR18bvnJH78pUNBu0aDgjiLd
 k088FduCX8PMKc2oaJoyO2tHHXHNFNW0A7K5ZQ+x/EP3BVGPnkZvxg04zW7XaK8aZ0njHpVTGx6cj
 3L5zoDbjXMNl2+R9Mum4RLSsagi58SaMMFRpuRnNf8FyYntapoyjJ/At1ch9KlepJfzo=;
Received: from mail-pj1-f65.google.com ([209.85.216.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1ipGPj-00DhYD-2v
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jan 2020 18:50:44 +0000
Received: by mail-pj1-f65.google.com with SMTP id s94so95872pjc.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 08 Jan 2020 10:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GqM7/Gox89N6RYmX8N+C+JYNDY9Y92t5hXeig9A+0NE=;
 b=U3nfmbMHq/W60Cggp7RJIO+vjwZF+eOByq0zw2NdD3Ar4SSHaOIVputw0PVblX2/o4
 rGuycl8hULEeLa76n6VKtiejtrAZxV2ip7LKG2pkIUppk7kP+nYsoJH8PIA2ERd6eHZF
 7kg8c8oxe1HfsuNiPK04ZvCZVI7p4MrF4wrplzGBHJ7+0t7oRiI5MUorB0njq6uxH/p4
 g3w3/0xI8Flgn5SK4qw2rmZOVRk4uCUJbVGYc+4YUDe02CHqfod56+BNdpYqpkr4u4Ju
 QWRtvYtE+1qc0bdsIr5YDGmM3klH/1hIseMl+g3jErzlysuBDR4N36fNB1+B3orn9fso
 nn7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GqM7/Gox89N6RYmX8N+C+JYNDY9Y92t5hXeig9A+0NE=;
 b=F+4P835OXRFOLqA+I4EF5ar/hdGDC/tNb8NaQPMkwmemsLta2HMCocR7KUE706PpLs
 xdCFxzBD++hfA7A8HNU1xzO3RxiBE4D8byu/41jsXh+HQlBt+iGvpUk+nV7YuYxKfk6y
 kjSNRv+298WQt2mrChLvva7P6vmZ3n9HqkAWNGMw2tAKBG/qRrk6IL0ZSRc8NiIYXqUd
 qph3S2MHHfiiTN+3YXXBxV6vBl7uA3BfUR4EP7RPzQTaWfL2skPw66e/9m/uWZM2W2PW
 MJvNSNvTPeJYlqOgZAbXqbpEmH9Rv1KwmunSyWYsud0Lsq5BEFqDguFbfNYmpfj2haTC
 lQGA==
X-Gm-Message-State: APjAAAWuSheNNCXF0OnfWyaU7TDjU6b+nG0w8HF9iyXLJZOYVCtwVM5f
 SLcxNdgYmuDc2r7fZJ4ZlM3FSA==
X-Google-Smtp-Source: APXvYqwLsrqAQku6UEZ+m75sX13ln6fLUNoETR2ZmPckprU0bqTzke9nFnndvHW2jpMVg425OyWE3w==
X-Received: by 2002:a17:90a:480a:: with SMTP id a10mr14637pjh.88.1578508990909; 
 Wed, 08 Jan 2020 10:43:10 -0800 (PST)
Received: from google.com ([2620:15c:201:0:7f8c:9d6e:20b8:e324])
 by smtp.gmail.com with ESMTPSA id y7sm4734645pfb.139.2020.01.08.10.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 10:43:10 -0800 (PST)
Date: Wed, 8 Jan 2020 10:43:05 -0800
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200108184305.GA173657@google.com>
References: <20191218145136.172774-1-satyat@google.com>
 <20200108140556.GB2896@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200108140556.GB2896@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -14.8 (--------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.8 FSL_HELO_FAKE          No description available.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.65 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.65 listed in wl.mailspike.net]
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
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -1.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ipGPj-00DhYD-2v
Subject: Re: [f2fs-dev] [PATCH v6 0/9] Inline Encryption Support
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
Cc: linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jan 08, 2020 at 06:05:56AM -0800, Christoph Hellwig wrote:
> I haven't been able to deep dive into the details, but the structure
> of this still makes me very unhappy.
> 
> Most of it is related to the software fallback again.  Please split the
> fallback into a separate file, and also into a separate data structure.
> There is abslutely no need to have the overhead of the software only
> fields for the hardware case.
> 
The fallback actually is in a separate file, and the software only fields
are not allocated in the hardware case anymore, either - I should have
made that clear(er) in the coverletter.
> On the counter side I think all the core block layer code added should
> go into a single file instead of split into three with some odd
> layering.
> 
Alright, I'll look into this. I still think that the keyslot manager
should maybe go in a separate file because it does a specific, fairly
self contained task and isn't just block layer code - it's the interface
between the device drivers and any upper layer.
> Also what I don't understand is why this managed key-slots on a per-bio
> basis.  Wou;dn't it make a whole lot more sense to manage them on a
> struct request basis once most of the merging has been performed?
I don't immediately see an issue with making it work on a struct request
basis. I'll look into this more carefully.

Thanks!
Satya


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
