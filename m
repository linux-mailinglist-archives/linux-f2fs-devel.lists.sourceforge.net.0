Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E66454FDF5C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Apr 2022 14:21:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1neFWK-0001ig-F5; Tue, 12 Apr 2022 12:21:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jakobkoschel@gmail.com>) id 1neFWI-0001i7-PL
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Apr 2022 12:21:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IzJCMQcfk2LS05QX3t+F4QP/1tjShGb6Ooy0sIJVLiY=; b=C9+G72oQUiCCvEL6TUIvvpKH1N
 fSpggPuIYq/nGw7XBgEO5pROVkdujAr3S7eezJOecYC9lrJCehIMAkTLPXjomKe85IOosG0zmJYPe
 wWj1XAcebQwoGINr5bRPptz0gCElLvk+T8be+Y1DPlTfmHw4QwPKM5UEV6rHMxgUO13w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=IzJCMQcfk2LS05QX3t+F4QP/1tjShGb6Ooy0sIJVLiY=; b=G
 e9vybS5zk2N7qK6QGf3YiC6keXhbIrX2EUGa0/oFIXwxCpHT+JspfIrCQO05dmLugtDQ3RKjFqBgj
 9jmGw6DPpW6Q0W1vk0wFZ2FDsk4jwG0g/OdxgtPjk8S77B1bFgQzPps8ogOocas6XjzQ2XRnkIyZ6
 VlD5y/StNX93zI/s=;
Received: from mail-ed1-f48.google.com ([209.85.208.48])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1neFWE-00E0sY-Bt
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Apr 2022 12:21:19 +0000
Received: by mail-ed1-f48.google.com with SMTP id b24so22087325edu.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 12 Apr 2022 05:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IzJCMQcfk2LS05QX3t+F4QP/1tjShGb6Ooy0sIJVLiY=;
 b=E4xO9sPBDCWCWLk9kftCh0w0N3Cuz39OrLZhKqBsBTqzL1fZN8rDVp+5JpQSpFwT3A
 dY4LV3DjIoqH7I7B6FNo2nZBH5/Y4byJUGhwd7HbYgk7AFqjTsBaGXsX61aeJXEEchEB
 szuQFcdogT7CPTeurL+Q2HEjAzXH7wPdV+7B0qijGfzGwQ9js5RqJjnq032dacfCKVhM
 g0az0tt8dq430Q1JoeknsQzRlIMjfwmzCXIIuAFso0fFgxsR7f5c0t0ZD67aaFkVLzTE
 XE04sKGlJwllwsbraBoSp/+HmBtjWzvVC4JwnvvmtiVMx+SQ2Z+W/jVmqt0vysudQshJ
 loXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IzJCMQcfk2LS05QX3t+F4QP/1tjShGb6Ooy0sIJVLiY=;
 b=Xu9hD7QEFP9+nBDk1ZndJYIO65DclU9CTEkq7PnnCWl5CqhU1vKvfWIYHgoxaEeeS9
 8k4cZ8mfNgujs/Rs7IwWcy/9GaHTeUI0Z6CSq5Zt81oeLjyssm0sAZgEuKaFDQsvLE4L
 M2PJ0i+hVt6PgDMaeea1i1VqZBOZQfMIUMYde/sQ40u5d+BMMqWUd5AY7Me53vkM8aNh
 v6jO3Nzjp2LlbX2tMgxCR9rgrt1FE/vMpZi7i4TE4NW440PBEFiYcw/EY4r383QuyzgB
 y4oI+qr9tBCCQcph0a3WpzUgETya+tI5/K/H6ONLAZIQulujeay8xVKfuAIP7P0Im3Ce
 GfLQ==
X-Gm-Message-State: AOAM530MADNMepGKSl3H3te/JXdnWnx7gypew/+64aGWku81dLUzuSRM
 46Yr6h9WgiFyYZcDRLCM8VggwQJcqayxVg==
X-Google-Smtp-Source: ABdhPJyNKaWIEZRkY89LGHWnXV/bh5ppnLjvI645Mx1dycERHTuYg9+4sor4BlXGHalI/ohmU7UVqQ==
X-Received: by 2002:a05:6402:354d:b0:41d:dfe:6a8c with SMTP id
 f13-20020a056402354d00b0041d0dfe6a8cmr26438988edd.286.1649766067989; 
 Tue, 12 Apr 2022 05:21:07 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 op12-20020a170906bcec00b006e89b09a238sm1954081ejb.4.2022.04.12.05.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 05:21:07 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Tue, 12 Apr 2022 14:20:39 +0200
Message-Id: <20220412122040.3555423-1-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: In preparation to limit the scope of a list iterator to the
 list traversal loop, the usage of the list iterator variable 'next' should
 be avoided past the loop body [1]. Instead of calling list_move_tail() on
 'next' after the loop, it is called within the loop if the correct location
 was found. After the loop it covers the case if no location was found and
 it should b [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [jakobkoschel[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.48 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.48 listed in wl.mailspike.net]
X-Headers-End: 1neFWE-00E0sY-Bt
Subject: [f2fs-dev] [PATCH v2 1/2] f2fs: Remove usage of list iterator pas
 the loop for list_move_tail()
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
Cc: linux-kernel@vger.kernel.org, "Bos, H.J." <h.j.bos@vu.nl>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>,
 Jakob Koschel <jakobkoschel@gmail.com>, linux-f2fs-devel@lists.sourceforge.net,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In preparation to limit the scope of a list iterator to the list
traversal loop, the usage of the list iterator variable 'next' should
be avoided past the loop body [1].

Instead of calling list_move_tail() on 'next' after the loop, it is
called within the loop if the correct location was found.
After the loop it covers the case if no location was found and it
should be inserted based on the 'head' of the list.

Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---

v1->v2:
- Add early return to avoid introducing additional 'iter' variable
  (Chao Yu)

 fs/f2fs/segment.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 22dfeb991529..7ec1a2ef2167 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4181,10 +4181,12 @@ static void adjust_sit_entry_set(struct sit_entry_set *ses,
 		return;

 	list_for_each_entry_continue(next, head, set_list)
-		if (ses->entry_cnt <= next->entry_cnt)
-			break;
+		if (ses->entry_cnt <= next->entry_cnt) {
+			list_move_tail(&ses->set_list, &next->set_list);
+			return;
+		}

-	list_move_tail(&ses->set_list, &next->set_list);
+	list_move_tail(&ses->set_list, head);
 }

 static void add_sit_entry(unsigned int segno, struct list_head *head)

base-commit: 3e732ebf7316ac83e8562db7e64cc68aec390a18
--
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
