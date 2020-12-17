Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 802892DD413
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Dec 2020 16:24:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Kepze5bhWhGNBSJsf/EgzI8x5l8ToyCL0cIjotCCveM=; b=KuQ7cqJQgC/sBnJzsUNo3Z3VX
	2dcMnlVh3LPbVYxlCO4J3g4qlOVJy9ZAOxcCY67wvYCA2y4RdkGXaW8PkjTu8peYWVyR+VM5OuoUo
	wlDveKpaKVobniz6zPpPeNO/xa9/k3e2KfdCJc5c8iPo+w+FPLVcEsJzYUAmk3LwYQTNU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kpv8e-0005F1-MH; Thu, 17 Dec 2020 15:24:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <satyat@google.com>) id 1kpv8c-0005Et-TY
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 15:24:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N0X1DCRxzloLcq/I12JrF6wjku1BEW6h4ePAndekIaw=; b=kNGEQkNBm0BbBaeZgoYtDJAjp+
 zhPVzFgoYH9hhHUEFxBd9uPkeSWp9ZO0qfQOpq9eFChh+lkrRRtBFmIkrp7QTfYy0iEYUjI8JHSq6
 FU2ChdbGoLY5pX3o7XhAY04JsejuU887Myn+nf/gw9FXF8yd6/TPFfNnuxECt39dSKGA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N0X1DCRxzloLcq/I12JrF6wjku1BEW6h4ePAndekIaw=; b=Vy2aUH8xclYQxtgqD+eFckBToL
 xvvBaHbIm3qwOxMzrpns1heBwHHKzyoFwLyt8MZCRERL5EvWNkKiw/UjAaK767Tf6zHjWGiyX/e7k
 veKtiah3GtTGCC1s9DXmvQDQlXRjqg6PQ73VxghMdZCx9wopRapY8CtgVYtVfJHnJxWY=;
Received: from mail-pg1-f177.google.com ([209.85.215.177])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kpv8U-0003T7-W8
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 15:24:18 +0000
Received: by mail-pg1-f177.google.com with SMTP id i7so8849395pgc.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 17 Dec 2020 07:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=N0X1DCRxzloLcq/I12JrF6wjku1BEW6h4ePAndekIaw=;
 b=s1yiqE9QLy0+JQiZIk1aZzccQ+uRiZHhNx0Fttnf8TQNySsbgwfOXZcDayNIbHABQ2
 JcQV4o+eApR1pEh8bZgVUABWjLVErV2zCfb9wsjVttbxSRWgw18xcvqEg8PYX/i2EIT0
 2k6ROrX8kcB6QHpfuHKYVi6pW6fribJgrLqADDZImEVnohh+Nk2Cim+33/eFG2Zh6LhR
 FrR9kjSajTzGJiapkuZ6/km8EPRv6lCuB4LdzU1QPa54GobhOXKwIwkh5v3HZMb1Ozcf
 1bp4XBJkGrczRdGslpVrTqRn5BYARI1Iyj6fv4Yc4FSVVZA7HMVugYpWcEFX8f8DzeUc
 pJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=N0X1DCRxzloLcq/I12JrF6wjku1BEW6h4ePAndekIaw=;
 b=RQskxaYicKExgLlqzZ352en1LiP9lp+HVL1/7RgHcbUy8sTgTbguN8/sng5XtCxGhW
 vNgxO6Vca8kPoMs9phJF4LamWmWwhpYOiJbLGSXk4Bj4WjH5EKfwaX4wdMNY6SzeFZ1m
 t2Q9Epuzs++BpGe566VO9XUx+7Ikr3pjYILqLvAq3xCLyxZsVNKRYrs9eDyB2yusYHXK
 hhWBPCjjF7q8yW5n6iEEyf3OkNPEXSjOEXBJHyZXMiZiR48EN2KYTUwbQSrayI6fqhfb
 /G5/gJZgLPfxA/oesEwsNDTgQ1K+muNXf/4Tnkv3gXeTVvU5LQ+eQMTObg4tQfnUPrs2
 78WA==
X-Gm-Message-State: AOAM531dVnMM7Gl8bGvRLMSDcAr2IfYTfzor4t44JbIDBfjwQtagDI/n
 VwhcRrJJ7B4Mubh6IP5CUPnhuWD7wAW6Zg==
X-Google-Smtp-Source: ABdhPJzQYg4oUBNvdjWLc8LfDykAYEzEOhexJBoTKWfgUrSF2bq7qGnn3gDCM/TCEpYCQTCi0SIYaA==
X-Received: by 2002:a17:902:7292:b029:dc:ac9:25b5 with SMTP id
 d18-20020a1709027292b02900dc0ac925b5mr11849098pll.2.1608218168617; 
 Thu, 17 Dec 2020 07:16:08 -0800 (PST)
Received: from google.com (139.60.82.34.bc.googleusercontent.com.
 [34.82.60.139])
 by smtp.gmail.com with ESMTPSA id 19sm6248598pfu.85.2020.12.17.07.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 07:16:08 -0800 (PST)
Date: Thu, 17 Dec 2020 15:16:04 +0000
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Eric Biggers <ebiggers@kernel.org>, Chao Yu <chao@kernel.org>
Message-ID: <X9t2NKf/h7XjzOQA@google.com>
References: <20201217150435.1505269-1-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217150435.1505269-1-satyat@google.com>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FSL_HELO_FAKE          No description available.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.177 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.177 listed in wl.mailspike.net]
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
X-Headers-End: 1kpv8U-0003T7-W8
Subject: Re: [f2fs-dev] [PATCH v2 0/3] add support for metadata encryption
 to F2FS
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
Cc: linux-fscrypt@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Dec 17, 2020 at 03:04:32PM +0000, Satya Tangirala wrote:
> Changes to the userspace
> tools (that are required to test out metadata encryption with F2FS) are
> also being sent out - I'll post a link as a reply to this mail once it's
> out.

The userspace changes are at
https://lore.kernel.org/linux-f2fs-devel/20201217151013.1513045-1-satyat@google.com/


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
