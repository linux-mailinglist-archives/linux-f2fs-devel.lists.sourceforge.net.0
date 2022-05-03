Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 087D2518A72
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 May 2022 18:50:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nlvjk-0008Bm-L2; Tue, 03 May 2022 16:50:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1nlvjd-0008BS-20
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 May 2022 16:50:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XGyhawv5lvAz+jR7b+4J1tPg3EThTh3JtzLNgN/2cvM=; b=YHYSH6BwlwzEJVGUge5aCorX3T
 zHxoXzpFakNNTmst0dHCzM/qSP9aVLeOaCazOy3LYD2lEgSz8CTQ85L2hEXaaTi44J35twjMRvlRo
 3E3exTXw+Ca6ob8YsFPM+pCHOnnQiOKFr8HzKP8NzCK9H4eG/AO1MS8ock1lY56HyNkQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XGyhawv5lvAz+jR7b+4J1tPg3EThTh3JtzLNgN/2cvM=; b=dxXP5mylBKThRTkEjK/tDRgOpn
 a6quyhkTOo0fkrnZHlZFTyFSXIy5xa7MWeu0Fol5S8HMckFdemFK+w8y5n98fuxUcKXk/ULF3qR1s
 f8jTKkcz0RSRIbTjfolJ4g5DD1aJ/vtQksi7HCGyFYeE6S5GL1QgTtiDowR7vSV2NLkQ=;
Received: from mail-oi1-f175.google.com ([209.85.167.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nlvjb-0004QM-Ho
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 May 2022 16:50:47 +0000
Received: by mail-oi1-f175.google.com with SMTP id l16so11510861oil.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 03 May 2022 09:50:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XGyhawv5lvAz+jR7b+4J1tPg3EThTh3JtzLNgN/2cvM=;
 b=I1OCWEDW5apAy+KEVjADtrMYUamYycVkDTKyJYI2VdodMdI2OqwFKTZWmmFscZtwaJ
 nkFHB/Tc3omr+vuTjdgBfdlexv52ojozaesgxC3HQ8Lpi94EbxL2P5kWtGanVi4NWSOr
 Edyf2FaSXYZ+fWjugxVWnX1JnvFwGW9QmiE+Eze5zRSCxNWpineo82KzWcahhCk7jPXk
 Ug+zudk3l+TyvNH1UqZqWpMXq8wExo4KGrc2SIUnQOHechxLjchBdq2++zPQgs2utJOP
 wXonu8Uz8RosDEARCrjVnYDLkIzLGO489rPSYyOpxi4l/RZEssp6NhBzk/T+xcnFWK9Q
 io2A==
X-Gm-Message-State: AOAM531pr2ZBv9ISgTbVJQzInAfl5NQPe3WW4n6pxQrfl7QF421t3m7M
 xZpbVU1DJTDCCmlVS/9G1no=
X-Google-Smtp-Source: ABdhPJy1OCeyAd/qiMByFFTTxHMId2iF4W5yKbLjTMlEc1yur0rFxDRZF7LK/3VXrAqw2kuZPRsPmQ==
X-Received: by 2002:a05:6808:2126:b0:325:c9f5:46e1 with SMTP id
 r38-20020a056808212600b00325c9f546e1mr2356270oiw.239.1651596641690; 
 Tue, 03 May 2022 09:50:41 -0700 (PDT)
Received: from [10.10.69.251] ([8.34.116.185])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a4ae6cf000000b0035eb4e5a6cdsm5044278oot.35.2022.05.03.09.50.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 09:50:40 -0700 (PDT)
Message-ID: <1e3afa38-0652-0a6a-045c-79a0b9c19f30@acm.org>
Date: Tue, 3 May 2022 09:50:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Pankaj Raghav <p.raghav@samsung.com>, jaegeuk@kernel.org,
 axboe@kernel.dk, snitzer@kernel.org, hch@lst.de, mcgrof@kernel.org,
 naohiro.aota@wdc.com, sagi@grimberg.me, damien.lemoal@opensource.wdc.com,
 dsterba@suse.com, johannes.thumshirn@wdc.com
References: <20220427160255.300418-1-p.raghav@samsung.com>
 <CGME20220427160301eucas1p147d0dced70946e20dd2dd046b94b8224@eucas1p1.samsung.com>
 <20220427160255.300418-6-p.raghav@samsung.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20220427160255.300418-6-p.raghav@samsung.com>
X-Spam-Score: -2.4 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/27/22 09:02,
 Pankaj Raghav wrote: > - sector &= ~(ns->zsze
 - 1); > + sector = rounddown(sector, ns->zsze); The above change breaks 32-bit
 builds since ns->zsze is 64 bits wide and since rounddown() uses the C
 division operator instead of div64_u64(). 
 Content analysis details:   (-2.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.175 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.175 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
 -2.9 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nlvjb-0004QM-Ho
Subject: Re: [f2fs-dev] [PATCH 05/16] nvme: zns: Allow ZNS drives that have
 non-power_of_2 zone size
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
Cc: jiangbo.365@bytedance.com, kch@nvidia.com, matias.bjorling@wdc.com,
 gost.dev@samsung.com, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, clm@fb.com, dm-devel@redhat.com, agk@redhat.com,
 jonathan.derrick@linux.dev, kbusch@kernel.org, linux-fsdevel@vger.kernel.org,
 josef@toxicpanda.com, linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/27/22 09:02, Pankaj Raghav wrote:
> -	sector &= ~(ns->zsze - 1);
> +	sector = rounddown(sector, ns->zsze);

The above change breaks 32-bit builds since ns->zsze is 64 bits wide and 
since rounddown() uses the C division operator instead of div64_u64().

Thanks,

Bart.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
