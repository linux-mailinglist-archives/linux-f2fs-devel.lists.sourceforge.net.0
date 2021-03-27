Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DD534B9C0
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Mar 2021 23:10:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UA+3JdMxqSfLNkxkh5s1qA4ykj6XoODpIhLAW+IHn9E=; b=bnYIz/eGt5Py/FUNNriEogmQ6
	swKRydAIwjXgFYbFdDwqPTUPA+5hNQyYccb7SPLquuHXW6ncENyIH/qjPiOVFcavprlhHnq420QjB
	ck0HdiqBSgRlDn//HhX2nXshYdHIJ3j2HKRr7cPE+soS+JY2IdI8LuYjpJL+4WI2XiNDI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lQH8E-0006l1-Du; Sat, 27 Mar 2021 22:10:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <oleksandr@natalenko.name>)
 id 1lQGnR-0003Z8-0a; Sat, 27 Mar 2021 21:48:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H0SDVFh4IivwpMZhwg29PF9BCGg9OFyVJ9dY0fRESwI=; b=I/Mk6y0xJi+7Y78PrIULIgT+CG
 +llk54k7G2B36SxdtY3GiqUcBLAwzv2QacsLSiv8gG5ULRcJ3ERqDYPfvDygJ4QplZYtkjIMtA0PS
 FuTkwn9Ztp+o8u/3lr9fPwcgNordBmfnFIn7mdKLW9ktmRxpys6VgXliUVtqalR5yVbk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H0SDVFh4IivwpMZhwg29PF9BCGg9OFyVJ9dY0fRESwI=; b=fnxGkwbQ3biLF3H/9OOfWK1YkA
 yhQy9o/gN4TfPC3fZGQb815yrANrrjf47T7AVO11fkd1lgQTtVSaIMtb7mKy4IXt6Vndh9RFzK4U5
 TDSL4ed7Pf3isx/cSARiHY0temCHQyyqVNT+5Gdj2KKPqOYY2S64CPUE/ShpcNe/ANJ0=;
Received: from vulcan.natalenko.name ([104.207.131.136])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lQGn9-001rgR-3n; Sat, 27 Mar 2021 21:48:38 +0000
Received: from localhost (kaktus.kanapka.ml [151.237.229.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by vulcan.natalenko.name (Postfix) with ESMTPSA id B4B19A0401C;
 Sat, 27 Mar 2021 22:48:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
 s=dkim-20170712; t=1616881690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H0SDVFh4IivwpMZhwg29PF9BCGg9OFyVJ9dY0fRESwI=;
 b=BL+GUFCBXmgH15fMcWEI5fZPb3RtVIZpbw7ravQoctDAuyGRUPeBO/3bYVJlwH0iCzWlfE
 RnFV/7gSbFNp7IOm1fk1imqr3RP7JpwOMZAvooCrFStqhusNUrghw99i00sKgtt5L8jLjY
 AeUWNsKKkPDhk2r5p1tVwsa7sLk1b4Q=
Date: Sat, 27 Mar 2021 22:48:10 +0100
To: kernel test robot <lkp@intel.com>
Message-ID: <20210327214810.ldijpbr2tnkh2gce@spock.localdomain>
References: <20210326191859.1542272-2-nickrterrell@gmail.com>
 <202103271719.VoxPHugN-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202103271719.VoxPHugN-lkp@intel.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1lQGn9-001rgR-3n
Subject: Re: [f2fs-dev] [PATCH v8 1/3] lib: zstd: Add kernel-specific API
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
From: Oleksandr Natalenko via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: squashfs-devel@lists.sourceforge.net,
 Chris Mason <chris.mason@fusionio.com>, kbuild-all@lists.01.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Nick Terrell <nickrterrell@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Petr Malat <oss@malat.biz>,
 linux-crypto@vger.kernel.org, Kernel Team <Kernel-team@fb.com>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello.

On Sat, Mar 27, 2021 at 05:48:01PM +0800, kernel test robot wrote:
> >> ERROR: modpost: "ZSTD_maxCLevel" [fs/f2fs/f2fs.ko] undefined!

Since f2fs can be built as a module, the following correction seems to
be needed:

```
diff --git a/lib/zstd/compress/zstd_compress.c b/lib/zstd/compress/zstd_compress.c
index 9c998052a0e5..584c92c51169 100644
--- a/lib/zstd/compress/zstd_compress.c
+++ b/lib/zstd/compress/zstd_compress.c
@@ -4860,6 +4860,7 @@ size_t ZSTD_endStream(ZSTD_CStream* zcs, ZSTD_outBuffer* output)
 
 #define ZSTD_MAX_CLEVEL     22
 int ZSTD_maxCLevel(void) { return ZSTD_MAX_CLEVEL; }
+EXPORT_SYMBOL(ZSTD_maxCLevel);
 int ZSTD_minCLevel(void) { return (int)-ZSTD_TARGETLENGTH_MAX; }
 
 static const ZSTD_compressionParameters ZSTD_defaultCParameters[4][ZSTD_MAX_CLEVEL+1] = {
```

Not sure if the same should be done for `ZSTD_minCLevel()` since I don't
see it being used anywhere else.

-- 
  Oleksandr Natalenko (post-factum)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
