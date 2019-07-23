Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3844A72319
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jul 2019 01:33:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2cOlf+x5O/ys2vYYtsm77YeWo70LJqy2Jm7Tlhll7j4=; b=aSIv/jc5xQzNlBoy1N4dsEWvs
	tjwsC5BCckcnKoEa3T6rtZB0/vKASUeBIz33nQQXCVNrAHxkNtJ6b+k5mtFnMvC9Ff9Ydud8nH4ee
	Y1/YLaOuBXdI9kiRKnIezjgVH9PuQotHhv+GART1O+EAd9x4Ysl1/nCk2nP9wKzGY8mR8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hq4Hr-0000CZ-Uv; Tue, 23 Jul 2019 23:33:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3DpM3XQYKAAMgurvhqjrrjoh.frp@flex--drosen.bounces.google.com>)
 id 1hq4Hq-0000AW-32
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Jul 2019 23:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yhEVR+lyaQktfxSLQ/EB+rshNGy8yD7d36OlQswd69s=; b=fSDuEIeI6ToKRAlu5wCAxqxwG
 kE6wqMst7EP9644UvjpvMqj1/qij5+GQBlj0B2BDXuBbQ/5N215K/3ObU2RmTLROTGryHHtU8ZYo7
 kVfR29QIj8oS8X4+jPGHLNJ9lf0enPpMVS6bCmhV/+H+3YF/EM/PRbY8LPSXiaK37R1Fo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yhEVR+lyaQktfxSLQ/EB+rshNGy8yD7d36OlQswd69s=; b=ff3H2RTAorCej8n5gIDucoc9VI
 oPXNFLgGwEC+iGIkIYrrtmmRg/UySK6OMW6ge2Z0R1oq+Ds88oHi5+T52lrOsDaWzdjf++Dv5UEVM
 Ii4OXmSgeFD8I84Vg/z00ZzlMy0sxt3gudloLyb9+cWDo4ZoUE0l467tpC3iLDAGgGQg=;
Received: from mail-ot1-f74.google.com ([209.85.210.74])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hq4Ho-00FAXh-8F
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Jul 2019 23:33:38 +0000
Received: by mail-ot1-f74.google.com with SMTP id v49so24746533otb.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 23 Jul 2019 16:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=yhEVR+lyaQktfxSLQ/EB+rshNGy8yD7d36OlQswd69s=;
 b=MpvWJogDMmHQ2qrE16nKlM51a8S8juN4VRqWI7Y7hxGArHYnoMo171MSqnp0UMAbiY
 M4ZsiHyFZy+tNob1BA48IiEW2FawnZr/tAXd6fH1yDW/ZoZIPdrX9l6ar2QptSWdyI2V
 qcDLq3uh/BjJUYlgGyyuZlq7GfmtcSL3jXsz7W1gc6vo0xB1iBOY6ibHPOOl2DnhJ7yT
 +nlx8f/YSL4dLcVNxGGhh2uN6Ahy+VlBKv3B1YJDLXSuS+zi3htFgNC4QyUi0OaVNKjb
 jfpP5V44L+Q65wwreiOiNTae0K3lqfR62T9zMCxFQbkDqkY2fQx6b1MBPVChbBDHy51s
 HkFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=yhEVR+lyaQktfxSLQ/EB+rshNGy8yD7d36OlQswd69s=;
 b=ochW/sArigBDoNpegSkmQSxbly17aF8mB5vEbL4+fLG9QlooB8MJ4poeV8CpjSi+X7
 nyG0SBHz2T0aQLlW2GBe1Ngku7W2FfkqfqEvH6OyqhP9uNPEvaMBHBj8kvftF42bLffb
 k+BrZ0uOTxZto0+9QT5+y4zeAfXUQCZUQSQ1MGRMtDm0A9W+gt9OyHeibQXhoz9o+hZy
 oni20M/gHHtK5Uf79SRdleXlu/daiyzDEJ4JWkKWrnOaa3Zcty6gDQbRx6EWLfyztE8D
 VKSMmTAjOEqHLluyuss5qRlvJVlzWky1Y2GBRRvNtQCVrjpuq63VTQiJy5ZrOiMLkqe1
 tC7Q==
X-Gm-Message-State: APjAAAUH7wl7NKe2m01slSp+Vrwg/ZtyMt3WFtr2oGkieNQ6lOPGvH5E
 fHL5bIKNgsVcrXq6Kb/NF02FZpHPa8I=
X-Google-Smtp-Source: APXvYqxw57uNDKnlnh6qfncy9p6M/AL26AsgzE3ddNVSUXTIoicDTMYvXmTOpYQ5xpgukSD1KAWW9WK21Qs=
X-Received: by 2002:a63:7a06:: with SMTP id v6mr79320562pgc.115.1563923214813; 
 Tue, 23 Jul 2019 16:06:54 -0700 (PDT)
Date: Tue, 23 Jul 2019 16:05:27 -0700
In-Reply-To: <20190723230529.251659-1-drosen@google.com>
Message-Id: <20190723230529.251659-2-drosen@google.com>
Mime-Version: 1.0
References: <20190723230529.251659-1-drosen@google.com>
X-Mailer: git-send-email 2.22.0.657.g960e92d24f-goog
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>, 
 Jonathan Corbet <corbet@lwn.net>, linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.74 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1hq4Ho-00FAXh-8F
Subject: [f2fs-dev] [PATCH v4 1/3] fs: Reserve flag for casefolding
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: Daniel Rosenberg <drosen@google.com>, linux-doc@vger.kernel.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In preparation for including the casefold feature within f2fs, elevate
the EXT4_CASEFOLD_FL flag to FS_CASEFOLD_FL.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 include/uapi/linux/fs.h       | 1 +
 tools/include/uapi/linux/fs.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
index 59c71fa8c553a..2a616aa3f6862 100644
--- a/include/uapi/linux/fs.h
+++ b/include/uapi/linux/fs.h
@@ -311,6 +311,7 @@ struct fscrypt_key {
 #define FS_NOCOW_FL			0x00800000 /* Do not cow file */
 #define FS_INLINE_DATA_FL		0x10000000 /* Reserved for ext4 */
 #define FS_PROJINHERIT_FL		0x20000000 /* Create with parents projid */
+#define FS_CASEFOLD_FL			0x40000000 /* Folder is case insensitive */
 #define FS_RESERVED_FL			0x80000000 /* reserved for ext2 lib */
 
 #define FS_FL_USER_VISIBLE		0x0003DFFF /* User visible flags */
diff --git a/tools/include/uapi/linux/fs.h b/tools/include/uapi/linux/fs.h
index 59c71fa8c553a..2a616aa3f6862 100644
--- a/tools/include/uapi/linux/fs.h
+++ b/tools/include/uapi/linux/fs.h
@@ -311,6 +311,7 @@ struct fscrypt_key {
 #define FS_NOCOW_FL			0x00800000 /* Do not cow file */
 #define FS_INLINE_DATA_FL		0x10000000 /* Reserved for ext4 */
 #define FS_PROJINHERIT_FL		0x20000000 /* Create with parents projid */
+#define FS_CASEFOLD_FL			0x40000000 /* Folder is case insensitive */
 #define FS_RESERVED_FL			0x80000000 /* reserved for ext2 lib */
 
 #define FS_FL_USER_VISIBLE		0x0003DFFF /* User visible flags */
-- 
2.22.0.657.g960e92d24f-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
