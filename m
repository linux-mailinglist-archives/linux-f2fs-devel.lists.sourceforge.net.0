Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D26156257
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  8 Feb 2020 02:36:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/uCHd9g4OjAhW1aVdqooMSsU1VumSOHiYCHqfNPpzNQ=; b=VxlSYRDxOOcdCxubWoEjqHV+Y
	N008ALVGZDeDL5uvXU6vfiqAKUkIVfZ/mZ0j+rKT2JCvPanl7NeD0hqpReepMT0WiOw3HSvN06bD9
	GRhiUgEDus1CbgNRWPSqMRp7xZfIpdfa6ppKRhu4NHYauLJdawAxBWg2qNWQe8NlFwjbI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j0F2W-0006Vl-96; Sat, 08 Feb 2020 01:36:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3fhA-XgYKAI8wA7Bx6z77z4x.v75@flex--drosen.bounces.google.com>)
 id 1j0F2U-0006VW-4g
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 08 Feb 2020 01:36:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fTgB3kb3O+v8ILq/4TyTQ+b9UXnhOVk2x96mgR9bebg=; b=PLoNqUM6iTxcPxZybD0wVfgKZ
 Bu+3JuFSPr/il4m2xG7AERvgJdNOjhodQCdb6//Q5jW9ez0JB11Oqskf737zBzaF8dvGmIeg64W37
 R1gGVK85B5VyIkA+Z5eh6OOcN/BtbZwEf8qTXIGhDKmJXQ9bOtblUkw9t7U4aNLfDshEE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fTgB3kb3O+v8ILq/4TyTQ+b9UXnhOVk2x96mgR9bebg=; b=eZ63MYRrMY83vWte3RzL3nzCk7
 /nCoVIluv6tmhQkS4bVYCHL0Gsu934xKhQbNNqutk4vAAi/pq5Q0lJqgdYjX6Wt4R/5vRycj/KlvA
 2cy5cbhGHPrIr+YLrxYwliGIvlE4a+6V+xJzV8nef+blYd0W7ylA3gKPmFCAtSD+HNow=;
Received: from mail-pg1-f202.google.com ([209.85.215.202])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1j0F2S-003aiw-I7
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 08 Feb 2020 01:36:06 +0000
Received: by mail-pg1-f202.google.com with SMTP id a4so766480pgm.23
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 07 Feb 2020 17:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=fTgB3kb3O+v8ILq/4TyTQ+b9UXnhOVk2x96mgR9bebg=;
 b=g8ETqpmpRRWAN/I/0ihQuyhV6cZrzbIoeWPe0HONBVPSLk67hHc/HvOH5Y3E3sfXKm
 osLLtnREDZD+rb6zzkHfRBvJ4qwb6tOshn0h48zQROO/wU8i8sGw0n8zAkLu/i4laHlm
 VC5SF2YtA82PkH2qCWdQZ3RA7cLHrzjuCckH/Zo905k7Bj/TUHVv0pdQVck5swTV6UjO
 TqoElEBtPPPO4CjPtYIJ6/4J5p2FrFj5rtoF9klcjg6S6LJUJF4xprkxdTmeJM1Cviks
 gEoth9u806ySIHFmhgq9F7gJ08gTEEDvk84fAtCnN59hxoWQi08SIbLfXedYovWzn5eQ
 qBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=fTgB3kb3O+v8ILq/4TyTQ+b9UXnhOVk2x96mgR9bebg=;
 b=qyN6QyiojPEpqz5TeiCEBb5x4/NVAjO5dbj5tepBiJRD8u7ZIyW2uu7yzfbQVrnWy2
 XJ/9vMsY3k+0BYm7uoh5yRVNe/X+8f7YVJIbv7rXn0vMjAnGkG4as7ZDHkPg8CElCcyV
 GrBmcAw2fmkZOGFQ6SZ+PQM16HYBIJIPtbsjM3gRfUlo/5NGgYcH5g4f0QT7/y2ECY6n
 Df4i+RdQjna4Fg4Si7Q8K87SQGqRSsxcEeGfXkEAXUUjc1Hy7rDrAQoSUcgSbdqjafQw
 inb6ZY8D/kYgtpLazeOvZXD0PZD5sUoIqyRWGoVy+zCBSaoSbaeXPj9ZyIFxk7hn+WMf
 oCZg==
X-Gm-Message-State: APjAAAVPhcpHZIH7+w8L5nwTgb4AViqLgUfSlTSxZ7Ug5CDMJfC8k5dh
 z7Z5P67v8eJw22SSBsarrsKdobyNwhA=
X-Google-Smtp-Source: APXvYqw8lDISo/3URgAqCG25ywWyahbrkFc0mVlthEd962mlaZLm/wh8kHzbBfWez9CSIlqY/2EODpA3fUU=
X-Received: by 2002:a65:56c6:: with SMTP id w6mr2149182pgs.167.1581125758626; 
 Fri, 07 Feb 2020 17:35:58 -0800 (PST)
Date: Fri,  7 Feb 2020 17:35:45 -0800
In-Reply-To: <20200208013552.241832-1-drosen@google.com>
Message-Id: <20200208013552.241832-2-drosen@google.com>
Mime-Version: 1.0
References: <20200208013552.241832-1-drosen@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>
X-Spam-Score: -7.8 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.202 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.202 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j0F2S-003aiw-I7
Subject: [f2fs-dev] [PATCH v7 1/8] unicode: Add utf8_casefold_iter
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
 kernel-team@android.com, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This function will allow other uses of unicode to act upon a casefolded
string without needing to allocate their own copy of one.

The actor function can return an nonzero value to exit early.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/unicode/utf8-core.c  | 25 ++++++++++++++++++++++++-
 include/linux/unicode.h | 10 ++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/fs/unicode/utf8-core.c b/fs/unicode/utf8-core.c
index 2a878b739115d..db050bf59a32b 100644
--- a/fs/unicode/utf8-core.c
+++ b/fs/unicode/utf8-core.c
@@ -122,9 +122,32 @@ int utf8_casefold(const struct unicode_map *um, const struct qstr *str,
 	}
 	return -EINVAL;
 }
-
 EXPORT_SYMBOL(utf8_casefold);
 
+int utf8_casefold_iter(const struct unicode_map *um, const struct qstr *str,
+		    struct utf8_itr_context *ctx)
+{
+	const struct utf8data *data = utf8nfdicf(um->version);
+	struct utf8cursor cur;
+	int c;
+	int res = 0;
+	int pos = 0;
+
+	if (utf8ncursor(&cur, data, str->name, str->len) < 0)
+		return -EINVAL;
+
+	while ((c = utf8byte(&cur))) {
+		if (c < 0)
+			return c;
+		res = ctx->actor(ctx, c, pos);
+		pos++;
+		if (res)
+			return res;
+	}
+	return res;
+}
+EXPORT_SYMBOL(utf8_casefold_iter);
+
 int utf8_normalize(const struct unicode_map *um, const struct qstr *str,
 		   unsigned char *dest, size_t dlen)
 {
diff --git a/include/linux/unicode.h b/include/linux/unicode.h
index 990aa97d80496..2ae12f8710ae2 100644
--- a/include/linux/unicode.h
+++ b/include/linux/unicode.h
@@ -10,6 +10,13 @@ struct unicode_map {
 	int version;
 };
 
+struct utf8_itr_context;
+typedef int (*utf8_itr_actor_t)(struct utf8_itr_context *, int byte, int pos);
+
+struct utf8_itr_context {
+	utf8_itr_actor_t actor;
+};
+
 int utf8_validate(const struct unicode_map *um, const struct qstr *str);
 
 int utf8_strncmp(const struct unicode_map *um,
@@ -27,6 +34,9 @@ int utf8_normalize(const struct unicode_map *um, const struct qstr *str,
 int utf8_casefold(const struct unicode_map *um, const struct qstr *str,
 		  unsigned char *dest, size_t dlen);
 
+int utf8_casefold_iter(const struct unicode_map *um, const struct qstr *str,
+		    struct utf8_itr_context *ctx);
+
 struct unicode_map *utf8_load(const char *version);
 void utf8_unload(struct unicode_map *um);
 
-- 
2.25.0.341.g760bfbb309-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
