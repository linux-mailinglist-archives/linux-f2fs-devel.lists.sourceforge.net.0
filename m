Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4222736F39B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Apr 2021 03:27:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lcHvx-0001zR-QL; Fri, 30 Apr 2021 01:27:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <nickrterrell@gmail.com>)
 id 1lcHvj-0001vH-5g; Fri, 30 Apr 2021 01:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tjglHgCdOo9aNmUJ+U7eL0Rhds1mEanZ0rRyCnAz6WU=; b=XWZZIp03Ytwy1UbtdcBXCJO71W
 nxif5gaXTNld7vwkaE5IflmlL1fV4CAGm7zxCESYEqlSswj2M16PHUZ7qh9VolqDYss7lXDfulfGh
 YOWILAzxnpBAhpH5xGmIg4Plwn7LDIdLsZOtS3F3UnDW+3D8nAjsdY5WE+wP2IqcNVno=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tjglHgCdOo9aNmUJ+U7eL0Rhds1mEanZ0rRyCnAz6WU=; b=aEq+1F6WvxcPJd8q0dz0uRTgcd
 D6sxSUDOry4+GYw0XEdtPrZRjDys9GC80tWxaPwQIiwiq1LXobcbJSMMaRZF/5sOn2rsNFsLrDvzn
 udp7ajM3QbjE5VON/REoJ0dpBB4jG6XqnwtkdLc/e1jVD/XVj6rsj/gIoUEeppslibCk=;
Received: from mail-pf1-f182.google.com ([209.85.210.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lcHvc-0002V5-FN; Fri, 30 Apr 2021 01:26:54 +0000
Received: by mail-pf1-f182.google.com with SMTP id i13so398526pfu.2;
 Thu, 29 Apr 2021 18:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tjglHgCdOo9aNmUJ+U7eL0Rhds1mEanZ0rRyCnAz6WU=;
 b=pj5P1pc1D/l2b4G37TELLspq5umpYDb7fJAakA5nU9s2OKvky8Gr2sOFZBsmSZcVzn
 0dapmB3JMg75SErVUxSLYE3xSIWfTGQIWmLLfoweixXhjLGXckATDL3tG5ujCt3mp3wO
 Kfk1VRKOmWkCqMqo2p9IfYiz25m9eSi5rdqKPTPluwhJcDkvHVhBLtmTtwdxUwtBLhRT
 nNhz7eco5j0Sa+zXo9BPUAFFH1X0ZEHWo0icezreb17kzhPxQ8tXaqpD2EViZAAtx4DW
 NBMKUKqg4YQiG7O3BE3OxzU+hTJvt58VO+KU0Rp9D/6CtWI7vCs1j/v3cM10D4HmUduI
 c9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tjglHgCdOo9aNmUJ+U7eL0Rhds1mEanZ0rRyCnAz6WU=;
 b=dQlk6IbaSdOGZvOTjAvV3ZKYr3BoIB2o+Qqarkeo3U/Xnvh1IhswmvhHpgSH1LW6SD
 c+NwIBzf18MhyrBWkpxZUcnBFcXj1p0Yqlv0e4+Ffa57PnafwJYxmkjX7T0dqyJp3XvU
 akfIZ0RajZ9hY3qYZYaRJw+1AEIYD5iW77UI69o7cdwMPLi6Lbl/4K7cmyTNpA9/cLIZ
 Pt98tIqLHfN0DF+fztatVlJ1RQNCxgCX3HkMGWvzh8oCHOw8HV1B44ZzRl8hSGW3CoA7
 X3p290z9nqeVn2dOCUyNZnr00+aMs/8BkG0c3RS/5iKnzWBPhG+S2WiIKEBl6e0bbq6Z
 yn8A==
X-Gm-Message-State: AOAM533Ti2wEfZMlyM20zNkS0WOtcSGE/ZKh77FOpyTUY9lYIT72PtGe
 NjhR1n3WELAiHASna9xYOaA=
X-Google-Smtp-Source: ABdhPJySKjyTMc6tGPbKhCO1pK7lKmK7mC+K3AwnlUS/dsZ1CseFwgiVdGcS+MV9xytaOCrYZFANbg==
X-Received: by 2002:a63:a16:: with SMTP id 22mr2310271pgk.345.1619746002964;
 Thu, 29 Apr 2021 18:26:42 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net.
 [98.33.101.203])
 by smtp.gmail.com with ESMTPSA id b186sm311004pfb.27.2021.04.29.18.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 18:26:42 -0700 (PDT)
From: Nick Terrell <nickrterrell@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 29 Apr 2021 18:31:57 -0700
Message-Id: <20210430013157.747152-5-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210430013157.747152-1-nickrterrell@gmail.com>
References: <20210430013157.747152-1-nickrterrell@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: fb.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.182 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.182 listed in wl.mailspike.net]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (nickrterrell[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lcHvc-0002V5-FN
Subject: [f2fs-dev] [PATCH v11 4/4] MAINTAINERS: Add maintainer entry for
 zstd
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
Cc: squashfs-devel@lists.sourceforge.net, Randy Dunlap <rdunlap@infradead.org>,
 Eric Biggers <ebiggers@kernel.org>, Johannes Weiner <jweiner@fb.com>,
 Christoph Hellwig <hch@infradead.org>, Nick Terrell <nickrterrell@gmail.com>,
 Yann Collet <cyan@fb.com>, David Sterba <dsterba@suse.cz>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Petr Malat <oss@malat.biz>, Chris Mason <clm@fb.com>,
 Nick Terrell <terrelln@fb.com>, linux-crypto@vger.kernel.org,
 Felix Handte <felixh@fb.com>, Oleksandr Natalenko <oleksandr@natalenko.name>,
 Kernel Team <Kernel-team@fb.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 Niket Agarwal <niketa@fb.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Nick Terrell <terrelln@fb.com>

Adds a maintainer entry for zstd listing myself as the maintainer for
all zstd code, pointing to the upstream issues tracker for bugs, and
listing my linux repo as the tree.

Signed-off-by: Nick Terrell <terrelln@fb.com>
---
 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9450e052f1b1..7025c67248f7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19912,6 +19912,18 @@ F:	Documentation/vm/zsmalloc.rst
 F:	include/linux/zsmalloc.h
 F:	mm/zsmalloc.c
 
+ZSTD
+M:	Nick Terrell <terrelln@fb.com>
+S:	Maintained
+B:	https://github.com/facebook/zstd/issues
+T:	git git://github.com/terrelln/linux.git
+F:	include/linux/zstd*
+F:	lib/zstd/
+F:	lib/decompress_unzstd.c
+F:	crypto/zstd.c
+N:	zstd
+K:	zstd
+
 ZSWAP COMPRESSED SWAP CACHING
 M:	Seth Jennings <sjenning@redhat.com>
 M:	Dan Streetman <ddstreet@ieee.org>
-- 
2.31.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
