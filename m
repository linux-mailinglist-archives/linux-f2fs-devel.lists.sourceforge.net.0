Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3768B2763EF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Sep 2020 00:39:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kLDQM-0002v7-1S; Wed, 23 Sep 2020 22:39:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <nickrterrell@gmail.com>)
 id 1kLDQK-0002uu-B2; Wed, 23 Sep 2020 22:39:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s2HCAxyO+XuYMLzto3YJY+q/fwyGyhZhVewL5HVF+qc=; b=FcoeaGpi1gv3dPns1IUl7ujTTW
 azQIVJGzBQ8Cn8+0+rbVCMoOJynaY1p7JoYPlwf0uSaKAra/u+ihin2YcNhjL5NK/bBHxev34DhSf
 d+VWK8L+bjAdstPAXtPllRIPnh31wO0ER9zc6yC3qc/MlhabjSGSi1IVs7zGM0tHBjII=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s2HCAxyO+XuYMLzto3YJY+q/fwyGyhZhVewL5HVF+qc=; b=NJfReJDun9grKUgUJuKhWK3F/p
 dYfhgJrvJMPVnl3l4Zd72Afv1Wtw0Mt6VwjmqpMdioav2P4x1BMMuz5uYezzV3nwukMDlC6ngFbbN
 HPVGI+BQJjM3ag3WX8ZAk9P0d5p8GJqLwowCiL0hNnd9oTj8czmibcFhcfe/0zKNxjrM=;
Received: from mail-pj1-f66.google.com ([209.85.216.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kLDQF-0038KM-A6; Wed, 23 Sep 2020 22:39:39 +0000
Received: by mail-pj1-f66.google.com with SMTP id fa1so523790pjb.0;
 Wed, 23 Sep 2020 15:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s2HCAxyO+XuYMLzto3YJY+q/fwyGyhZhVewL5HVF+qc=;
 b=eLpDqrxN9NOvY6BEWZ8r0J6Hg1IA42S988jZCVhPEyrifHrk1+kez6N3oNJi+64VWU
 0v/nMaeSjGZZqBJzwu5C9f0adQsHPV2jZJVP2KbX1GK1aUYO7T1FVoN2zG+56+3xCo5P
 auSomm5ZsSToHbMmhwv5F8reABWfIAW64r10ScRpMRY5f2DN241xgXWNExy8NvEHt+9F
 hjXGLYdxswq2GAA93wKA6l9s6FeTC675qKb6aQOXdE9WKExxBCWUDTPNbybyUVHv126n
 mmg7jjpXc/Q1VRoPYCr7SqmNcYbRFj29uwtuVmWQIQU1QVgASlRBYAJVt9x79zq4XnjH
 w5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s2HCAxyO+XuYMLzto3YJY+q/fwyGyhZhVewL5HVF+qc=;
 b=DRiheYfmvNBz1Xz0indQsAf/IlG7dsT0DfHtuMHRLgn0m20Y1DezDIDwGsWjxFRISn
 UbIuTiU8jSzNmq71f/oZHrz3V3SiXlkBw1ehtsBh6E7xl213UrMM0v6vCIJOwOK1XvMC
 S75ooQ2pRPaKuoJDKRIgw86QACQPwD+Y0SC6WAtzP0dFB8TEY6WhdSmwaObSK/D74Hqq
 2PnLgo11vBTe82VP7GnqIeWvKpvOGbkx1HsXQECy6GxfI2kkt7hKEUSSXpbAF+y5xwzj
 KP7TK4nHWZ1879sYNiEbOqV8p3tkvEHj6cAqFz9w7z2+Gc0IQPdOYLmy0M3Z5hruNHlS
 b7GQ==
X-Gm-Message-State: AOAM530WyQIFUzvd4QyC+lHx5B4na+vJNXUASZmNPucn0jPIu7AirDUo
 l0oHXN3yPSbub1yELKYyE4E=
X-Google-Smtp-Source: ABdhPJzoKgqsoCy046jumPIK27/+u46M/bZKhAGULWig0jKxb35TB+RdSsFCafaDgvOOyX7ZrFTdMg==
X-Received: by 2002:a17:90b:1487:: with SMTP id
 js7mr1270240pjb.187.1600900769712; 
 Wed, 23 Sep 2020 15:39:29 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net.
 [98.33.101.203])
 by smtp.gmail.com with ESMTPSA id d20sm417964pjv.39.2020.09.23.15.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 15:39:29 -0700 (PDT)
From: Nick Terrell <nickrterrell@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Date: Wed, 23 Sep 2020 15:42:06 -0700
Message-Id: <20200923224206.68968-10-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200923224206.68968-1-nickrterrell@gmail.com>
References: <20200923224206.68968-1-nickrterrell@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: fb.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.66 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (nickrterrell[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.66 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kLDQF-0038KM-A6
Subject: [f2fs-dev] [PATCH v3 9/9] lib: zstd: Remove zstd compatibility
 wrapper
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
Cc: squashfs-devel@lists.sourceforge.net, Johannes Weiner <jweiner@fb.com>,
 Christoph Hellwig <hch@infradead.org>, Nick Terrell <nickrterrell@gmail.com>,
 Yann Collet <cyan@fb.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Petr Malat <oss@malat.biz>,
 Chris Mason <clm@fb.com>, Nick Terrell <terrelln@fb.com>,
 linux-crypto@vger.kernel.org, Kernel Team <Kernel-team@fb.com>,
 Niket Agarwal <niketa@fb.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Nick Terrell <terrelln@fb.com>

All callers have been transitioned to the new zstd-1.4.6 API. There are
no more callers of the zstd compatibility wrapper, so delete it.

Signed-off-by: Nick Terrell <terrelln@fb.com>
---
 include/linux/zstd_compat.h | 116 ------------------------------------
 1 file changed, 116 deletions(-)
 delete mode 100644 include/linux/zstd_compat.h

diff --git a/include/linux/zstd_compat.h b/include/linux/zstd_compat.h
deleted file mode 100644
index cda9208bf04a..000000000000
--- a/include/linux/zstd_compat.h
+++ /dev/null
@@ -1,116 +0,0 @@
-/*
- * Copyright (c) 2016-present, Facebook, Inc.
- * All rights reserved.
- *
- * This source code is licensed under the BSD-style license found in the
- * LICENSE file in the root directory of https://github.com/facebook/zstd.
- * An additional grant of patent rights can be found in the PATENTS file in the
- * same directory.
- *
- * This program is free software; you can redistribute it and/or modify it under
- * the terms of the GNU General Public License version 2 as published by the
- * Free Software Foundation. This program is dual-licensed; you may select
- * either version 2 of the GNU General Public License ("GPL") or BSD license
- * ("BSD").
- */
-
-#ifndef ZSTD_COMPAT_H
-#define ZSTD_COMPAT_H
-
-#include <linux/zstd.h>
-
-#if defined(ZSTD_VERSION_NUMBER) && (ZSTD_VERSION_NUMBER >= 10406)
-/*
- * This header provides backwards compatibility for the zstd-1.4.6 library
- * upgrade. This header allows us to upgrade the zstd library version without
- * modifying any callers. Then we will migrate callers from the compatibility
- * wrapper one at a time until none remain. At which point we will delete this
- * header.
- *
- * It is temporary and will be deleted once the upgrade is complete.
- */
-
-#include <linux/zstd_errors.h>
-
-static inline size_t ZSTD_CCtxWorkspaceBound(ZSTD_compressionParameters compression_params)
-{
-    return ZSTD_estimateCCtxSize_usingCParams(compression_params);
-}
-
-static inline size_t ZSTD_CStreamWorkspaceBound(ZSTD_compressionParameters compression_params)
-{
-    return ZSTD_estimateCStreamSize_usingCParams(compression_params);
-}
-
-static inline size_t ZSTD_DCtxWorkspaceBound(void)
-{
-    return ZSTD_estimateDCtxSize();
-}
-
-static inline size_t ZSTD_DStreamWorkspaceBound(unsigned long long window_size)
-{
-    return ZSTD_estimateDStreamSize(window_size);
-}
-
-static inline ZSTD_CCtx* ZSTD_initCCtx(void* wksp, size_t wksp_size)
-{
-    if (wksp == NULL)
-        return NULL;
-    return ZSTD_initStaticCCtx(wksp, wksp_size);
-}
-
-static inline ZSTD_CStream* ZSTD_initCStream_compat(ZSTD_parameters params, uint64_t pledged_src_size, void* wksp, size_t wksp_size)
-{
-    ZSTD_CStream* cstream;
-    size_t ret;
-
-    if (wksp == NULL)
-        return NULL;
-
-    cstream = ZSTD_initStaticCStream(wksp, wksp_size);
-    if (cstream == NULL)
-        return NULL;
-
-    /* 0 means unknown in old API but means 0 in new API */
-    if (pledged_src_size == 0)
-        pledged_src_size = ZSTD_CONTENTSIZE_UNKNOWN;
-
-    ret = ZSTD_initCStream_advanced(cstream, NULL, 0, params, pledged_src_size);
-    if (ZSTD_isError(ret))
-        return NULL;
-
-    return cstream;
-}
-#define ZSTD_initCStream ZSTD_initCStream_compat
-
-static inline ZSTD_DCtx* ZSTD_initDCtx(void* wksp, size_t wksp_size)
-{
-    if (wksp == NULL)
-        return NULL;
-    return ZSTD_initStaticDCtx(wksp, wksp_size);
-}
-
-static inline ZSTD_DStream* ZSTD_initDStream_compat(unsigned long long window_size, void* wksp, size_t wksp_size)
-{
-    if (wksp == NULL)
-        return NULL;
-    (void)window_size;
-    return ZSTD_initStaticDStream(wksp, wksp_size);
-}
-#define ZSTD_initDStream ZSTD_initDStream_compat
-
-typedef ZSTD_frameHeader ZSTD_frameParams;
-
-static inline size_t ZSTD_getFrameParams(ZSTD_frameParams* frame_params, const void* src, size_t src_size)
-{
-    return ZSTD_getFrameHeader(frame_params, src, src_size);
-}
-
-static inline size_t ZSTD_compressCCtx_compat(ZSTD_CCtx* cctx, void* dst, size_t dst_capacity, const void* src, size_t src_size, ZSTD_parameters params)
-{
-    return ZSTD_compress_advanced(cctx, dst, dst_capacity, src, src_size, NULL, 0, params);
-}
-#define ZSTD_compressCCtx ZSTD_compressCCtx_compat
-
-#endif /* ZSTD_VERSION_NUMBER >= 10406 */
-#endif /* ZSTD_COMPAT_H */
-- 
2.28.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
