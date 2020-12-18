Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5E02DE237
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Dec 2020 12:54:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=f+9y5D2Ce9YoL/Zh4u5LMb1gtfZHvIj+M1DqslaZeyw=; b=iTJgNv1UlXQ4ev3ueke+zOKiC
	cVgnJxaK3ENAm9NOKFQ9vAzf75zgmn/8H6TiF9K6Fbb5XHJ2BEaUm8jN1B0RRYu8i7ZjyL0VOb7H/
	LBJbTryZ0IJcXRyy9Bqn0DjGY4Zup+ufRFE0qTzYYuHA6XWDIugl5yAcLsSivLphmnhK0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kqEL0-0000ZA-BM; Fri, 18 Dec 2020 11:54:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <satyat@google.com>) id 1kqEKy-0000Yf-8H
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Dec 2020 11:54:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EMOyMmi5OQh1mMw6pWH3HTsh9nX0nJvvkb+01sG5L6Q=; b=Ik/Yt//IkDTXGggZQZv1b7eYXt
 V7iTKR7Ro8jYujwIyou3k0rrez2vaL4522hFuJAKakTGCIB/YTn7WNAKoN2vkQfjibyL472DvzzVd
 QjWv1ripC5Ms67/z+O6AgImO1FO5UA/Ct5f+fyoOmMjCLPViF95a4hktobkLK1UYysFs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EMOyMmi5OQh1mMw6pWH3HTsh9nX0nJvvkb+01sG5L6Q=; b=iWVL2J+bHB1mXnFpxAf56YLkAs
 sNDUDIo76JyNa6Kjnq1UioowhDME5qU8Mf8T6PRY0AYaGb2E/OJzzbz7+82yrUSU3z2owpGlQ07q3
 i+GTiMIfWe2sdfvOXzHoc4+M4rZs6DwsCJPeBGZunMCgudx4B8+lqOMvR+c0ymCMcxdM=;
Received: from mail-pl1-f174.google.com ([209.85.214.174])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kqEKt-001GJN-OE
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Dec 2020 11:54:20 +0000
Received: by mail-pl1-f174.google.com with SMTP id q4so1280168plr.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 18 Dec 2020 03:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EMOyMmi5OQh1mMw6pWH3HTsh9nX0nJvvkb+01sG5L6Q=;
 b=OEqRBfN9ikmHv25/4WO0ioVGt+dtMVY9rOSKsI5lIuKBTvU4b+aYp4CCK82nWHGnS2
 rjLxRrIr/TQvF8gZBpg25+9PrMfCR6teCbq6+7toS/4enCVZg87drrlN9cOTyBOQ/+kZ
 0rIMRQV3Y7H5lJr5N7MFfK2xTyTOvpPt+kbgejrqeYe4xCTJCu26W53nxg3KXT55BVSj
 4BK1Bj6Ug2n5ufoys9NpoYzTBTU6KrsVsbBArZ6gDAycN/ciqAfBF73YU/QS6I6ENmpf
 DNXhWTbx7nR6WtTw9YBgslobxO3i88AalvYg1IuJaWD4eLKdTQbjO00LOIWzdBrcirIx
 UiLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EMOyMmi5OQh1mMw6pWH3HTsh9nX0nJvvkb+01sG5L6Q=;
 b=MVb886hZlymcvLBbZotscPgoi6bV7ompod418k4gFmhjti+ttPPLgDoE9HBRygHY4/
 2g6m/JUgjByYfTm2hT2kj6pKis5lCnk/vkqZrkbBSM6sF+ktkpouSEsblUPjoNrcuEcT
 qqF7Cue3yfDl9j3d3vRbb7/WP4K1gFp1cKr/wHa1Ia7x4P8w1DngiMzbh0yBhiX5Envl
 vM+0PQXeIyaoVQYeC0wk3r7FvFCKsIR+gF8fNHEC5robxhcjvMO5TLcgAJLAk3q2XlQ3
 vjgLM1lcKIa7k4k1nH8Khl2I6zZcLPlZPOSpuiGlD0Te/tp7imlF3OHjDSZ/sWLZsvni
 qNBw==
X-Gm-Message-State: AOAM5304//fVerrHpN++RvEHhyEpVDbt2fslZ4gpod3/fZKuXWBLb57Y
 kaaiUyPDq/wwOjgO6dE1FqdcOQ==
X-Google-Smtp-Source: ABdhPJwSlTiK2XI1930qTKhXQbTvQGl7TXUde9fI8+X06ym1hrnx7dRsCU6ClGix/2RdhYaIhNBIHQ==
X-Received: by 2002:a17:90a:5894:: with SMTP id
 j20mr3959568pji.107.1608292442787; 
 Fri, 18 Dec 2020 03:54:02 -0800 (PST)
Received: from google.com (139.60.82.34.bc.googleusercontent.com.
 [34.82.60.139])
 by smtp.gmail.com with ESMTPSA id gp14sm7862161pjb.6.2020.12.18.03.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 03:54:02 -0800 (PST)
Date: Fri, 18 Dec 2020 11:53:58 +0000
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <X9yYVuuLt3/hL17J@google.com>
References: <20201005073606.1949772-1-satyat@google.com>
 <471e0eb7-b035-03da-3ee3-35d5880a6748@huawei.com>
 <X9t8y3rElyAPCLoD@google.com>
 <9a8d3ae2-a09f-f199-5cb1-48b1317b3d37@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9a8d3ae2-a09f-f199-5cb1-48b1317b3d37@huawei.com>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FSL_HELO_FAKE          No description available.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.174 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.174 listed in list.dnswl.org]
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
X-Headers-End: 1kqEKt-001GJN-OE
Subject: Re: [f2fs-dev] [PATCH 0/3] add support for metadata encryption to
 F2FS
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Dec 18, 2020 at 05:02:23PM +0800, Chao Yu wrote:
> On 2020/12/17 23:44, Satya Tangirala wrote:
> > On Sat, Oct 10, 2020 at 05:53:06PM +0800, Chao Yu wrote:
> > > Why not using nid as DUN, then GC could migrate encrypted node block directly via
> > > meta inode's address space like we do for encrypted data block, rather than
> > > decrypting node block to node page and then encrypting node page with DUN of new
> > > blkaddr it migrates to.
> > > 
> > The issue is, the bi_crypt_context in a bio holds a single DUN value,
> > which is the DUN for the first data unit in the bio. blk-crypto assumes
> > that the DUN of each subsequent data unit can be computed by simply
> > incrementing the DUN. So physically contiguous data units can only be put
> > into the same bio if they also have contiguous DUNs. I don't know much
> > about nids, but if the nid is invariant w.r.t the physical block location,
> > then there might be more fragmentation of bios in regular read/writes
> 
> Correct, considering performance of in batch node flush, it will be better to
> use pba as IV value.
> 
> But, what's the plan about supporting software encryption for metadata? Current
> f2fs write flow will handle all operations which may encounter failure before
> allocating block address for node, if we do allocation first, and then use pba
> as IV to encrypt node block, it will be a little complicated to revert allocation
> if we fail to encrypt node block.
> 
Software encryption for metadata is supported through the blk-crypto
framework - so encryption will happen in the block layer, not the
filesystem layer. So there's nothing extra/special we need to do if
there's an encryption failure - an encryption failure is no different
from a read/write failure in a lower layer from f2fs' perspective.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
