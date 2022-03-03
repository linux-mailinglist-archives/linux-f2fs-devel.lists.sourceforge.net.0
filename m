Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A02B4CB94E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Mar 2022 09:39:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nPgzN-0007ON-C6; Thu, 03 Mar 2022 08:39:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <xiam0nd.tong@gmail.com>)
 id 1nPgzM-0007NF-09; Thu, 03 Mar 2022 08:39:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SGMF6oSM44wO/3sji0yXCG/PEtOPShxdSQ68WLQRB2g=; b=Ku/d9GjLjOHcUHYbLDtHxlC4BF
 C076Ii953jH3SVtNO0kv4bZwJ9cBuIvBGacDIoMBCzK7KVo+sC/a6hG36IEqWIdS5AkJfx4BVuAIX
 QIFHYjDx/dQAMxkBYwsx7L+JVKkDQ9Im7DTLH15/S06atiNP3jPJRvxCZHWx4Npv6dtI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SGMF6oSM44wO/3sji0yXCG/PEtOPShxdSQ68WLQRB2g=; b=b/wif5LLiQjL3QLAGcj/3vusnf
 b8pp6QF4g0zYYi9U9vKSbiTL8Sk9EjbO8+qsEhBV6PuWIVVykRIUZ615k2d7C8NPUXHJgEDWUB8I6
 7+DBauUBucTxFxE4JVWQHvgswt6Gau6TkeaRyij//XUoLIgK9OmE/Cmol3F5ouCPjR7Q=;
Received: from mail-pf1-f170.google.com ([209.85.210.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nPgzF-0004m2-32; Thu, 03 Mar 2022 08:39:05 +0000
Received: by mail-pf1-f170.google.com with SMTP id p8so4168772pfh.8;
 Thu, 03 Mar 2022 00:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SGMF6oSM44wO/3sji0yXCG/PEtOPShxdSQ68WLQRB2g=;
 b=ZvINIOlHF3nZHDcX3MwxAzlzprOUAV7bE6ys/MgPVlfVq9lkuahVjDHsPLQ7QbaFo9
 fQEFqUdMgi81YiKV62ulZnN7ZvbWazV6yRB1Qn/XiuQndMVO9fvHUymuPfTr2Dg+jh50
 vUEnvjC71yyLrdhZGmiVJ4PzTrzLKfXKpEMH9pkW4eVCRVAqTfa9XuvSN7zcx65Vy8CK
 d46NAYhkVq2HOhizng3Ws+JRbkWyYjQl4vq/u0RRAuHhPVUlG5PBN7oH7sIbE0gusQ26
 6C+XTV9PxP4Ds6jAKJQCAmbFUS0yNAc3zTUs7Z/QKxXKC+XQ8KtJ4GqninQZxzg5r19Q
 dsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SGMF6oSM44wO/3sji0yXCG/PEtOPShxdSQ68WLQRB2g=;
 b=BGqqh8AzEgAMoVb9rVkffiPhvifeiMiMEeG8RcmERsnnx446tCvqWyFXY/NTfgySZk
 44Ij6i5Cmw/xjc8tjk88MOvIVjYWfoaNDVIa7pFjbShX7nFsoMMmnS+ZePl9mKHKYJ6z
 nWKV/IuF23CIgohrzQzwnJO2j+EWp/9SRA7QdHmrd+NLT6brxmvvXPdJovHZEBZLPJUu
 yv+jt/j2RU+PfsBVS8PgDhzTjf0+JlyfGe07HzQKXjWibRPq1SHN1WgamVFKLOp3AX1h
 dNorOf5VWdbwcxB1Btwjd9rtOED+kea6/OCW9jvVPRUZcKoqhBzaww4leMRl659jmRxO
 icJg==
X-Gm-Message-State: AOAM533ky9HRcVVee5OlPEw9nZNE3Rk+rBguGUpYTvVRHUcFyWJ24X6+
 NUtZuPxEx/vEKmuIjtbSSqk=
X-Google-Smtp-Source: ABdhPJxqu7M+1zWgFCPBx1x396RDv729JpxnE5pMePfUDpYTg5HqtDHmeV1ToBxB32C6BUNb5VRxjw==
X-Received: by 2002:a63:f03:0:b0:374:50b5:1432 with SMTP id
 e3-20020a630f03000000b0037450b51432mr28638188pgl.308.1646296735582; 
 Thu, 03 Mar 2022 00:38:55 -0800 (PST)
Received: from ubuntu.huawei.com ([119.3.119.19])
 by smtp.googlemail.com with ESMTPSA id
 q92-20020a17090a1b6500b001bc169e26aasm6405436pjq.2.2022.03.03.00.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 00:38:54 -0800 (PST)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: xiam0nd.tong@gmail.com
Date: Thu,  3 Mar 2022 16:38:31 +0800
Message-Id: <20220303083831.11833-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220303083007.11640-1-xiam0nd.tong@gmail.com>
References: <20220303083007.11640-1-xiam0nd.tong@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  correct for typo: -for (struct list_head *list = head->next, 
 cond = (struct list_head *)-1; cond == (struct list_head *)-1; cond = NULL)
 \ +for (struct list_head *list = head->next, *cond = (struct list_head *)-1;
 cond [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [xiam0nd.tong[at]gmail.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.170 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.170 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1nPgzF-0004m2-32
Subject: Re: [f2fs-dev] [PATCH 2/6] treewide: remove using list iterator
 after loop body as a ptr
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
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org, gustavo@embeddedor.com,
 linux-iio@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 linux@rasmusvillemoes.dk, dri-devel@lists.freedesktop.org, c.giuffrida@vu.nl,
 amd-gfx@lists.freedesktop.org, torvalds@linux-foundation.org,
 samba-technical@lists.samba.org, linux1394-devel@lists.sourceforge.net,
 drbd-dev@lists.linbit.com, linux-arch@vger.kernel.org,
 linux-cifs@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-staging@lists.linux.dev, h.j.bos@vu.nl, jgg@ziepe.ca,
 intel-wired-lan@lists.osuosl.org, nouveau@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, dan.carpenter@oracle.com,
 linux-media@vger.kernel.org, keescook@chromium.org, arnd@arndb.de,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 bjohannesmeyer@gmail.com, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, christophe.jaillet@wanadoo.fr,
 jakobkoschel@gmail.com, v9fs-developer@lists.sourceforge.net,
 linux-tegra@vger.kernel.org, tglx@linutronix.de,
 andriy.shevchenko@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 linux-sgx@vger.kernel.org, nathan@kernel.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 David.Laight@ACULAB.COM, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-mediatek@lists.infradead.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, christian.koenig@amd.com, rppt@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

correct for typo:

-for (struct list_head *list = head->next, cond = (struct list_head *)-1; cond == (struct list_head *)-1; cond = NULL) \
+for (struct list_head *list = head->next, *cond = (struct list_head *)-1; cond == (struct list_head *)-1; cond = NULL) \

--
Xiaomeng Tong


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
