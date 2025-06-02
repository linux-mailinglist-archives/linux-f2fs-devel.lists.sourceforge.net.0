Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DB3ACB945
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Jun 2025 18:06:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DMhzQtNM6iq7xaUGdvs+DqVS3fCmQnIXBKDxW9BmII=; b=dZhh67yUNf7HSGvBZwA45rYoSh
	HMKX5Z9Dr/kuMI0d2UYa1Mb4BzeVP3MBLQDXMhUX7KR29Mju5dQEAH3iVcEdGLtDVyUx5eGl5AzTG
	F+tSDnGPo/DvyeNU1JtX9GsHuS/CV3pwWe0cpd8xiU9xFH6h+xwzWPyu3idT4bdxz0O0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uM7g7-0004ZZ-82;
	Mon, 02 Jun 2025 16:06:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bernd@bsbernd.com>) id 1uM7g5-0004ZR-UA
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Jun 2025 16:06:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ECtcKLbK8c4DaaUNIeCZvRoLrnqb0sjqKj+TVBnd5MM=; b=ck67gNy51U+Cu6Ma7Kfyp7ipY4
 HDAv5XM5dNOhE1yoZIYn72wwbakhPlV38WEUEde1wWCsQjTTdd0uWid6v9b2POKBZrJ9fjuDH1raz
 GLaG/F8JeeTuwpVwbU84WymmvQ+4XkyIrpxTArTUpMXyjjH67CVPDspJBx7+a5hec6/g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ECtcKLbK8c4DaaUNIeCZvRoLrnqb0sjqKj+TVBnd5MM=; b=Iv4DX7zaYvS7NH0MMAlUrFZdi3
 kjSLHkkAPoO0I0JqybkOw543vq3s91xR/Yw/h1YrFmfHBxE+P8pBYwYw4jsHDxRhV89Or5Qj3oXno
 RmunpWqd5gR8dL1KXlhY4lc8Vmn2S97QOkkP18qEXXBeJFO/2QBLXz+YBaZxuvTauAmw=;
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uM7g4-0008I2-Ni for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Jun 2025 16:06:21 +0000
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailflow.phl.internal (Postfix) with ESMTP id BFAAC2005B9;
 Mon,  2 Jun 2025 11:50:54 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Mon, 02 Jun 2025 11:50:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1748879454;
 x=1748886654; bh=ECtcKLbK8c4DaaUNIeCZvRoLrnqb0sjqKj+TVBnd5MM=; b=
 YCpnVtE0/pyuTPAo2dUvlNHyIRQp7CHCmumKiV4wfwZrMpKynIqCRMi+p1/fH5ki
 dj4E9tYR3TXOZPU5t4o4uq231s9oha8SLHh8CQyqQyBALR8a/A2n+Vx+H7X+Q9Sn
 4ViHCvQ+jDpY1ADZJhYZOd0rga8bV2PNb5l8i5cQHJI++ZlV7jX97e503FVyTCD7
 j9a5w/cvUwsafKwtV/zrt1Q3kf750UNmYz8ITYWJf+FB1ExoeN4skydEd3q7rxoR
 feKziDyh97pABpZ5fLlQXcFoXsgxnfaICi7zMZ2D8toOxbS61HHSS6p8FLxbe4J6
 MhejaeOuGfov8wiSRSgi0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1748879454; x=
 1748886654; bh=ECtcKLbK8c4DaaUNIeCZvRoLrnqb0sjqKj+TVBnd5MM=; b=q
 emG5lsW68M9FqVhhIEhFON2CaL0suvIwrG82ESHJpVIu1h3F/i191l9hV+Dbzq2K
 6XbF2zYr9jTBC1UrwkB3ellb0/A+EYiudo0Eb/FvWwMOlm5klcdWq7LCWxNije/t
 mxfhG+dmqTcPiclnja7pOoXEAWSEZbgBHjFyfwNoMVSgyHOQYgQmOOTE4O+oZgSC
 laHY3LCBhpMnCsw39vPQujbi3SoZggk0SN27jw1FE2mQRTc2OH+q6fTfh9ZFVEEw
 PFsDIa8JF1LBia8YhzqwxFRv9h09aCTenlxMHU+Kw1W4v5MBfwjJBsYThMYAC0if
 jZoJMt5/e30D8q85LL4lQ==
X-ME-Sender: <xms:Xcg9aHIhY2nO5lH8xSqkRB0qRpNVxH7F9H8X35iKjKkKv9e4592r1w>
 <xme:Xcg9aLLFT-gsWHFts7phYKRLeyQKosLvuUeIxaQZ_Xex-ABQF9U31yE_HRiPWWPcW
 -nVoJiQ67Rdu_Fb>
X-ME-Received: <xmr:Xcg9aPtwDSmii5shQTEwaj3Hk_CD7B7Ab-NIrviAtjZQLJG7zOCUJoOst52df_3RcRkZAE_dehwWs0C34G-dT629jehro0BVCMfkBvgMgZFmAoHsjy29>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefkedtjeculddtuddrgeefvddrtd
 dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
 fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
 dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfev
 fhfhjggtgfesthejredttddvjeenucfhrhhomhepuegvrhhnugcuufgthhhusggvrhhtuc
 eosggvrhhnugessghssggvrhhnugdrtghomheqnecuggftrfgrthhtvghrnhephefhjeeu
 jeelhedtheetfedvgfdtleffuedujefhheegudefvdfhheeuveduueegnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsggvrhhnugessghssggv
 rhhnugdrtghomhdpnhgspghrtghpthhtohepfedupdhmohguvgepshhmthhpohhuthdprh
 gtphhtthhopehhtghhsehlshhtrdguvgdprhgtphhtthhopehkuhhnuggrnhdrkhhumhgr
 rhesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopehjrggvghgvuhhksehkvghrnhgvlh
 drohhrghdprhgtphhtthhopegthhgroheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
 vhhirhhoseiivghnihhvrdhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegsrhgruh
 hnvghrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjrggtkhesshhushgvrdgtiidp
 rhgtphhtthhopehmihhklhhoshesshiivghrvgguihdrhhhupdhrtghpthhtoheprghgrh
 huvghnsggrsehrvgguhhgrthdrtghomh
X-ME-Proxy: <xmx:Xcg9aAYJgqQmz_0i6NtyVbZeSTGQGdJbmubSjYWHEVPRSrWWEFEe6A>
 <xmx:Xcg9aOb_RKHyzMZjYao8mke_FVbcL-v2Df80QDBAD9sHg1hMl_H62g>
 <xmx:Xcg9aEA1OIXT30KKLzhLz1yXcjGGIsyU3yFQA4fZuvUdfeXXw9_nOg>
 <xmx:Xcg9aMa9Y0JhTXQUDvr_vzbW0j29L6GR1gk9r4Y-9wRdu1Vgoir90A>
 <xmx:Xsg9aFsYPtxDkjvPEIFtUlbaHsrqiDCTwy0xjaUHsIsFVgwYTdTJ-5lT>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Jun 2025 11:50:50 -0400 (EDT)
Message-ID: <99f79383-479e-4df1-9650-61fa3c600171@bsbernd.com>
Date: Mon, 2 Jun 2025 17:50:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christoph Hellwig <hch@lst.de>, Kundan Kumar <kundan.kumar@samsung.com>
References: <20250529111504.89912-1-kundan.kumar@samsung.com>
 <CGME20250529113257epcas5p4dbaf9c8e2dc362767c8553399632c1ea@epcas5p4.samsung.com>
 <20250529111504.89912-11-kundan.kumar@samsung.com>
 <20250602142157.GC21996@lst.de>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: en-US, de-DE, fr
In-Reply-To: <20250602142157.GC21996@lst.de>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/2/25 16:21,
 Christoph Hellwig wrote: >> static void fuse_writepage_finish_stat(struct
 inode *inode, struct folio *folio) >> { >> - struct backing_dev_info *bdi
 = inode_to_bdi(inode); >> + struct [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [103.168.172.141 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [103.168.172.141 listed in bl.score.senderscore.com]
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [103.168.172.141 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1uM7g4-0008I2-Ni
Subject: Re: [f2fs-dev] [PATCH 10/13] fuse: add support for multiple
 writeback contexts in fuse
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
Cc: ritesh.list@gmail.com, jack@suse.cz, djwong@kernel.org, amir73il@gmail.com,
 david@fromorbit.com, gfs2@lists.linux.dev, linux-mm@kvack.org, clm@meta.com,
 Joanne Koong <joannelkoong@gmail.com>, dave@stgolabs.net, agruenba@redhat.com,
 miklos@szeredi.hu, gost.dev@samsung.com, willy@infradead.org,
 p.raghav@samsung.com, Anuj Gupta <anuj20.g@samsung.com>,
 linux-nfs@vger.kernel.org, da.gomez@samsung.com, viro@zeniv.linux.org.uk,
 jaegeuk@kernel.org, axboe@kernel.dk, brauner@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, mcgrof@kernel.org, anna@kernel.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 6/2/25 16:21, Christoph Hellwig wrote:
>>  static void fuse_writepage_finish_stat(struct inode *inode, struct folio *folio)
>>  {
>> -	struct backing_dev_info *bdi = inode_to_bdi(inode);
>> +	struct bdi_writeback_ctx *bdi_wb_ctx = fetch_bdi_writeback_ctx(inode);
>>  
>> -	dec_wb_stat(&bdi->wb_ctx_arr[0]->wb, WB_WRITEBACK);
>> +	dec_wb_stat(&bdi_wb_ctx->wb, WB_WRITEBACK);
>>  	node_stat_sub_folio(folio, NR_WRITEBACK_TEMP);
>> -	wb_writeout_inc(&bdi->wb_ctx_arr[0]->wb);
>> +	wb_writeout_inc(&bdi_wb_ctx->wb);
>>  }
> 
> There's nothing fuse-specific here except that nothing but fuse uses
> NR_WRITEBACK_TEMP.  Can we try to move this into the core first so that
> the patches don't have to touch file system code?
> 
>> -	inc_wb_stat(&inode_to_bdi(inode)->wb_ctx_arr[0]->wb, WB_WRITEBACK);
>> +	inc_wb_stat(&bdi_wb_ctx->wb, WB_WRITEBACK);
>>  	node_stat_add_folio(tmp_folio, NR_WRITEBACK_TEMP);
> 
> Same here.  On pattern is that fuse and nfs both touch the node stat
> and the web stat, and having a common helper doing both would probably
> also be very helpful.
> 
> 

Note that Miklos' PR for 6.16 removes NR_WRITEBACK_TEMP through
patches from Joanne, i.e. only 

dec_wb_stat(&bdi->wb, WB_WRITEBACK);

is left over.


Thanks,
Bernd


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
