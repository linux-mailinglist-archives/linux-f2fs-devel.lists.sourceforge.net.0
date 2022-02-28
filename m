Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8064C698D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Feb 2022 12:09:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nOdty-0005Wh-6M; Mon, 28 Feb 2022 11:09:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jakobkoschel@gmail.com>)
 id 1nOdtw-0005V6-9h; Mon, 28 Feb 2022 11:09:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NwvvEiJPPM0SG7ZI4yc03tHRsjcGU4DYrm0+p7QW2+g=; b=RUQv5qrHqgQAwd6TNw6Nhgtn47
 l4gKN7yQhWMqz2wtn9VlbenKszMjl3EbZHFhVT2oLL9IppucL1C3YFtVjk2z7lzB5IMtaMhvVaF3I
 e4iUHHpz6HzlhZghVSBb7etQlWY1aPzJ0NMZR5TzE1Qd0qj3FyJ+HXX+V53fSbeFoy60=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NwvvEiJPPM0SG7ZI4yc03tHRsjcGU4DYrm0+p7QW2+g=; b=bI+yoY+5WsTcPhB8C3jlPMlyIG
 GlGw5ZWcQyUcdnrdLH0Nbr2FKzGGu4EErjLeivWuaDCniqCXn9k8vAsF2CU34XGhfuBZgw+IMUH3v
 BafXOheIm2rCJXSKWTfak4teg0/NxMHDs5OSEbU2S0lX/zs4c9IA9a+KWoJbDlMqINrQ=;
Received: from mail-ej1-f50.google.com ([209.85.218.50])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nOdtp-0001rq-RS; Mon, 28 Feb 2022 11:09:10 +0000
Received: by mail-ej1-f50.google.com with SMTP id p15so23996430ejc.7;
 Mon, 28 Feb 2022 03:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NwvvEiJPPM0SG7ZI4yc03tHRsjcGU4DYrm0+p7QW2+g=;
 b=XoHp2vZs5sXnnQm8jTsL06JwdjgH4Z1Am+qeboNHSyU/csHp7G8mKHTnYwT7vMJf3q
 1zZobpdX4BxBQ2erAJx74EzSCDXfVaAB33jAX9ZekfWtpz9xLL4KIzz7DciQBlIBY9DK
 vi6LJyw6u5UaEjT8CWPzRGPwv8GzX6oWgjgvygChKW8zu7PwVtsUQz/kuHu5rW/3vaBt
 P3mcu2gbh7uG62xQrliOtXiVl+brL2WoHfh7VHyAXnwazE3NNCXTKdQujGPQMoLCoB+H
 4TwL3ENhlSsI5tK0hgbUY+rfbxgFEyt/dohDr5V+g2PZ9mAGfyjh/75qZVaBOXbUEFp6
 QPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NwvvEiJPPM0SG7ZI4yc03tHRsjcGU4DYrm0+p7QW2+g=;
 b=KmqTZFkUCFgK3q6T58Hnhl3dCLoSptQXcTYKQiKU5DRmd4ueVTVmhrLlYDJEb9dDAh
 ygvLNsC9ylBySNCYNMOGhIQjPRn8djYa1D2AYDpuQ7DnkNv2yqYIVfyafDZt7B1wESv6
 VX3Ky7OjOyJQeKHx2HsEJ5B/vwoqB7tQm3fWJ77Kjn96sAau3OeMSsK6jh1vNZzoSoGg
 pM09bIBgCbnTQyIQBeomo+ZEs+mXwUlI4mqFlOpwe3WbEqetu+NI9uMNM0GnIyByJqfl
 syTjdtZvrS7fWROHfczYt//45fhsI1S7DiKdrmZShI9kZaP8J6XWawH68jdA2D8H2Lpq
 P+6g==
X-Gm-Message-State: AOAM531PNXOwtPlGLOApJrU9WvR1XXzhLSH35WTD1OwD9ocs4dqA/ZCn
 oIgUFu5TtBPSIaHXbUswTEs=
X-Google-Smtp-Source: ABdhPJwx6JZK1Sd067eYUFaKDGIuHgaxlGXhzFGfLUQYCLtFq3NCzAqvSFrK3I6DGGTf6F+6FgXuew==
X-Received: by 2002:a17:906:2608:b0:6c9:b248:4dcf with SMTP id
 h8-20020a170906260800b006c9b2484dcfmr14572317ejc.320.1646046539415; 
 Mon, 28 Feb 2022 03:08:59 -0800 (PST)
Received: from localhost.localdomain (dhcp-077-250-038-153.chello.nl.
 [77.250.38.153]) by smtp.googlemail.com with ESMTPSA id
 z22-20020a17090655d600b006d229436793sm4209049ejp.223.2022.02.28.03.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 03:08:59 -0800 (PST)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Feb 2022 12:08:20 +0100
Message-Id: <20220228110822.491923-5-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228110822.491923-1-jakobkoschel@gmail.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: When list_for_each_entry() completes the iteration over the
 whole list without breaking the loop, the iterator value will *always* be
 a bogus pointer computed based on the head element. To avoid type confusion
 use the actual list head directly instead of last iterator value. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [jakobkoschel[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.50 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.50 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nOdtp-0001rq-RS
Subject: [f2fs-dev] [PATCH 4/6] drivers: remove unnecessary use of list
 iterator variable
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
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel@lists.freedesktop.org, Cristiano Giuffrida <c.giuffrida@vu.nl>,
 amd-gfx@lists.freedesktop.org, samba-technical@lists.samba.org,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, linux-cifs@vger.kernel.org,
 kvm@vger.kernel.org, linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-staging@lists.linux.dev, "Bos, H.J." <h.j.bos@vu.nl>,
 Jason Gunthorpe <jgg@ziepe.ca>, intel-wired-lan@lists.osuosl.org,
 kgdb-bugreport@lists.sourceforge.net, bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-fsdevel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, v9fs-developer@lists.sourceforge.net,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-sgx@vger.kernel.org,
 linux-block@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When list_for_each_entry() completes the iteration over the whole list
without breaking the loop, the iterator value will *always* be a bogus
pointer computed based on the head element.

To avoid type confusion use the actual list head directly instead of last
iterator value.

Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 drivers/dma/dw-edma/dw-edma-core.c             | 4 ++--
 drivers/net/ethernet/intel/i40e/i40e_ethtool.c | 3 ++-
 drivers/net/wireless/ath/ath6kl/htc_mbox.c     | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 468d1097a1ec..7883c4831857 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -136,7 +136,7 @@ static void dw_edma_free_burst(struct dw_edma_chunk *chunk)
 	}

 	/* Remove the list head */
-	kfree(child);
+	kfree(chunk->burst);
 	chunk->burst = NULL;
 }

@@ -156,7 +156,7 @@ static void dw_edma_free_chunk(struct dw_edma_desc *desc)
 	}

 	/* Remove the list head */
-	kfree(child);
+	kfree(desc->chunk);
 	desc->chunk = NULL;
 }

diff --git a/drivers/net/ethernet/intel/i40e/i40e_ethtool.c b/drivers/net/ethernet/intel/i40e/i40e_ethtool.c
index 091f36adbbe1..c0ea9dbc4ff6 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_ethtool.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_ethtool.c
@@ -3963,7 +3963,8 @@ static void __i40e_reprogram_flex_pit(struct i40e_pf *pf,
 	 * correctly, the hardware will disable flexible field parsing.
 	 */
 	if (!list_empty(flex_pit_list))
-		last_offset = list_prev_entry(entry, list)->src_offset + 1;
+		last_offset = list_entry(flex_pit_list->prev,
+					 struct i40e_flex_pit, list)->src_offset + 1;

 	for (; i < 3; i++, last_offset++) {
 		i40e_write_rx_ctl(&pf->hw,
diff --git a/drivers/net/wireless/ath/ath6kl/htc_mbox.c b/drivers/net/wireless/ath/ath6kl/htc_mbox.c
index e3874421c4c0..cf5b05860799 100644
--- a/drivers/net/wireless/ath/ath6kl/htc_mbox.c
+++ b/drivers/net/wireless/ath/ath6kl/htc_mbox.c
@@ -104,7 +104,7 @@ static void ath6kl_credit_init(struct ath6kl_htc_credit_info *cred_info,
 	 * it use list_for_each_entry_reverse to walk around the whole ep list.
 	 * Therefore assign this lowestpri_ep_dist after walk around the ep_list
 	 */
-	cred_info->lowestpri_ep_dist = cur_ep_dist->list;
+	cred_info->lowestpri_ep_dist = *ep_list;

 	WARN_ON(cred_info->cur_free_credits <= 0);

--
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
