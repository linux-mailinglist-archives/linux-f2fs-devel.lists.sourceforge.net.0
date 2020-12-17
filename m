Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A33C32DD48A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Dec 2020 16:47:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O4iNBFhNALGh4w0Oky4LVFiZGbz5YQR26yRcKAzksVQ=; b=krTiyDBtk+7Ji/NRL+SB4O3Q5
	nJZ9+EM5y9+BDHhKQKsBbWUcK+wB2PKbA4+j51ugAVnXBDvFE1xkeU/evQdh+3jv+DYNSUDYOg4ys
	sWZO0LeA8eMutxcawNNTWVIIZCjjYMnjI0fe/QP/sZ5rN/Y+BUzoU+ho5MI7NiH+dIS3o=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kpvVW-0006TW-9O; Thu, 17 Dec 2020 15:47:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <satyat@google.com>) id 1kpvVV-0006TO-BH
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 15:47:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1C1AqW4sNXRKkfX44/tzO8IV7bN/wSKMDmqggH2yfUU=; b=Wf3OTZNOzx3JqDuGvfqbZ480KN
 apihQE4WFmFQOlqC/sqMUTY3sFle/iAo69cm6+tQfkWHYosATfGx8Nint/aC0CckifEZEL6433Zsf
 kkP2eV3d5tT9SKRJJsD1otALqDuAvxQIdZJfJwOIbpv1zCoFK7My1LEYlvPFQ/enmkbo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1C1AqW4sNXRKkfX44/tzO8IV7bN/wSKMDmqggH2yfUU=; b=ci1t/mKOd9u7A+ixffRjN0M2Vs
 O79X17yJeEy3Oa1/kt5JqggbG5drnseF45oLA2vpbCVOzKtN7iLsSCdxOiF+ypOmxiefwUirubuKG
 aXhN2sVGOvA6C0Wzo+5ewEHI9VYWKbjzcUS8lEgXQKce2h4kOjfdXat5i3pBY3rNi91s=;
Received: from mail-pf1-f177.google.com ([209.85.210.177])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kpvVM-000HQs-Qg
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 15:47:57 +0000
Received: by mail-pf1-f177.google.com with SMTP id d2so19279147pfq.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 17 Dec 2020 07:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1C1AqW4sNXRKkfX44/tzO8IV7bN/wSKMDmqggH2yfUU=;
 b=UqkezUBGjhl2d0xKtFCbKcxPpDuRtQH4NUl4oUDzOnpkiDJ45vXzpAqt1CeXKIxTcD
 fxmWBGNdE62+3v2ox+DtmHa9Qz/dGkFlcBaJ6u2lNDJFij+J1J4KX1axz9xcuB0a14MI
 DrPQpPJehaz4o0o55nGjk6I31bJj7Vl6hJaOjaSYSrzBIG7MvfccPqIRKZiKtxvWKHTz
 nuK/WiCGhVpTyGvkyjQ9+XPB95DzpyQpcE9TAeY9NVDbIsZ5WA96IgBoKMLQbtJIt+Sn
 MxDRhlRAcQPuNmc6gupd8oSajE7TpNh5jkVTItz7vFEZJ7Q9gt0QPAKeSalsMpYB0T6e
 efzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1C1AqW4sNXRKkfX44/tzO8IV7bN/wSKMDmqggH2yfUU=;
 b=fsduf7Qz/LYmqdGAeGHDpZ60UideMKWQPU8jUTcOaaTEJySYhaQKzhICwfCsbMUB7Y
 1kEVk6gL8atNZmj5V3nYzAE30HGLMOG2D1doG5DD/WO6gPbtyZcheEWgB48Q1VrjPopw
 Qc5hr9MHQG7Xq7oxtghxasN5d40jgChxVpFt4VjyX7GTW+yBq0vUN0y1xiocL7jWvtIx
 sRo1QT8r8oE3MTOQPtUb5pxp0tvGJJo3oO7s8IZujVHJRcrC7OnPWx4Gm/mXDq/4cQfK
 LlzyCW3gbuka8MJMINsU9A7cYOZJGMOxuWd7RVJqeBWKCez6Dr2w4CSDuVS89R432KqU
 vbdA==
X-Gm-Message-State: AOAM5321BGuJjBFW3K01Rijx4LGvwvAwc+fONn8Wnzwz/atjx8m6Lnmo
 ODtLi1TqN4HE4I1QU1EFXqcEKg==
X-Google-Smtp-Source: ABdhPJwwaYj0gD7YBJ5haxprxP8NjChy65mcRFE4vhIQ9EEKop6XqfXVpTQYNs8y5Gz4ShnRnTu++A==
X-Received: by 2002:a63:549:: with SMTP id 70mr15845265pgf.123.1608220063216; 
 Thu, 17 Dec 2020 07:47:43 -0800 (PST)
Received: from google.com (139.60.82.34.bc.googleusercontent.com.
 [34.82.60.139])
 by smtp.gmail.com with ESMTPSA id y189sm5788365pfb.155.2020.12.17.07.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 07:47:42 -0800 (PST)
Date: Thu, 17 Dec 2020 15:47:39 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>, Eric Biggers <ebiggers@kernel.org>,
 Chao Yu <chao@kernel.org>
Message-ID: <X9t9m+kNlyfH1Z4g@google.com>
References: <20201217151013.1513045-1-satyat@google.com>
 <20201217151013.1513045-2-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217151013.1513045-2-satyat@google.com>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FSL_HELO_FAKE          No description available.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: configure.ac]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.177 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.177 listed in wl.mailspike.net]
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
X-Headers-End: 1kpvVM-000HQs-Qg
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

I still need to update configure.ac to check for the new libraries -
I'll do that in v3 of the patch series


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
