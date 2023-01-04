Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F310565DE24
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jan 2023 22:15:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pDB6G-0002K9-73;
	Wed, 04 Jan 2023 21:15:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1pDB6F-0002Ju-4u
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 21:15:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yo+m9KCho02Llmwjmz5bDSbKVzw32DqjrZ5KrSHhgyc=; b=IXgHWiFeSbC2X1bajUWKZFogMP
 6AGjk8MjQXDu8Dm10qeXDS17L9Gh+7mlaA2jgyQHpJuauIBoXaLwogFEkS2TC85BnfZET/VFjdKBZ
 8NN/0ti+6IJJAdl3QeGEvTFgEoV8oGIK9ywfSYRWEAzShDKGSAZnMrcat9PV5N/AvZmg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Yo+m9KCho02Llmwjmz5bDSbKVzw32DqjrZ5KrSHhgyc=; b=meCC3o1Lws8nQ0VNeYdsAQ2qRp
 YN9Q5QM2ipi6rREzx4rOBbrKCIZdIKFVd0+B2qk2naTuRhHBfLeoVoFh0ieMk5TyDtobF48Nr2Q9z
 ouzTRQwIt3ARO0t6r89tyQ+Rn23gFseASqhzhAgH2HPVUznhVCqtwR2YhqOX3MJtY3DI=;
Received: from mail-pj1-f52.google.com ([209.85.216.52])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pDB6E-0050wC-EP for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 21:15:03 +0000
Received: by mail-pj1-f52.google.com with SMTP id
 o8-20020a17090a9f8800b00223de0364beso40225842pjp.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 04 Jan 2023 13:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yo+m9KCho02Llmwjmz5bDSbKVzw32DqjrZ5KrSHhgyc=;
 b=bjZkMxIPNZ3wmKI3QGSepT81I5OzcwJOIb/dnupKeJzgemoOZcjM4yfreHA+pwVbeP
 HOd/bgUCet0z9B/XX2tfep3wWWWYLyeCIHFa1NDUjFWQdX5A572uwUJHv92lvCUSn0jH
 nDD1ayF0cF1sYXZY6D7okVUr906wpDImdUvSkzV/8th2CAYrKdz3orCKBweWTHnMlK4j
 8Q9LXTwaogmTrXs5Gj4PAGJAZD90/jRoTwO/o58iZ0J59ckgaPVRY99HTFyy5G/KNc7Q
 k+iq8jJPMbsMV3H/So6AzW1W8RbB4qBsSsxHHBAFfFQVhi108BAllJmmP6SyPMsZeGbG
 6mUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yo+m9KCho02Llmwjmz5bDSbKVzw32DqjrZ5KrSHhgyc=;
 b=VXn4c0bvXiaa0SJ0iHDw/ZWrOSRLfmBtJih8y6dEMG3+3mjogXIgeDjMOlzBmVLHd4
 IECwP6dFYRhvHLsJZLF/jsuoVX/KVDBtYoDuWteRic2h3bE3gHRWQ3jl0beClfmm5Y7z
 JlxX69RYcQVXKeebcysHE/7nWo3YRT++eXK4e6fv7/R+VdBTaxwVsoShd9+hFUi3kFHx
 C49z0FquWNPIoWBZ1W6aQ4K+jOqz7gJtBqmObVIsuGPn8vMa0sMmd7RutKn2yn/n2peB
 oXeyDTyCsEHdpAo7svE9JqJeHHp7Rbx+WYP9nHilfzbPt4+C07yHUy74sYOfeosLv/Q0
 uhGA==
X-Gm-Message-State: AFqh2kpPzwzFXSGMIJ3YiCUVw8lI+uMGUtMPXPyCn4qK5056Lh5SW4k5
 X0DDy+eSQQI8JFLSELBuXsQ=
X-Google-Smtp-Source: AMrXdXtzyCslo5KrrtE6aj4KE0tZMImyQpChectqYz62yJ5Pkw2zwmGtohmj+/DGwHCRBdZk95hgJQ==
X-Received: by 2002:a17:90b:92:b0:225:eda7:13e with SMTP id
 bb18-20020a17090b009200b00225eda7013emr35757516pjb.40.1672866896879; 
 Wed, 04 Jan 2023 13:14:56 -0800 (PST)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:8002:1c20::a55d])
 by smtp.googlemail.com with ESMTPSA id
 i8-20020a17090a138800b00226369149cesm6408pja.21.2023.01.04.13.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 13:14:56 -0800 (PST)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  4 Jan 2023 13:14:26 -0800
Message-Id: <20230104211448.4804-2-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104211448.4804-1-vishal.moola@gmail.com>
References: <20230104211448.4804-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Add function filemap_grab_folio() to grab a folio from the
 page cache. This function is meant to serve as a folio replacement for
 grab_cache_page, 
 and is used to facilitate the removal of find_get_pag [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.52 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.52 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pDB6E-0050wC-EP
Subject: [f2fs-dev] [PATCH v5 01/23] pagemap: Add filemap_grab_folio()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add function filemap_grab_folio() to grab a folio from the page cache.
This function is meant to serve as a folio replacement for
grab_cache_page, and is used to facilitate the removal of
find_get_pages_range_tag().

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/pagemap.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 29e1f9e76eb6..468183be67be 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -546,6 +546,26 @@ static inline struct folio *filemap_lock_folio(struct address_space *mapping,
 	return __filemap_get_folio(mapping, index, FGP_LOCK, 0);
 }
 
+/**
+ * filemap_grab_folio - grab a folio from the page cache
+ * @mapping: The address space to search
+ * @index: The page index
+ *
+ * Looks up the page cache entry at @mapping & @index. If no folio is found,
+ * a new folio is created. The folio is locked, marked as accessed, and
+ * returned.
+ *
+ * Return: A found or created folio. NULL if no folio is found and failed to
+ * create a folio.
+ */
+static inline struct folio *filemap_grab_folio(struct address_space *mapping,
+					pgoff_t index)
+{
+	return __filemap_get_folio(mapping, index,
+			FGP_LOCK | FGP_ACCESSED | FGP_CREAT,
+			mapping_gfp_mask(mapping));
+}
+
 /**
  * find_get_page - find and get a page reference
  * @mapping: the address_space to search
-- 
2.38.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
