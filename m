Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E9B9BA5CC
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  3 Nov 2024 14:57:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t7b6L-0007c0-OO;
	Sun, 03 Nov 2024 13:57:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangyuli@uniontech.com>) id 1t7b6K-0007bk-7G
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 Nov 2024 13:57:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0u2qY5VmW02QoZQQ8PVGB0RvEt+gYfighmeowfpBp9Q=; b=EhD8c3nTv35gHKqAIAI3p62srr
 X0MhZn6gUBLySQ1kSN9MFagtWyDrqQmbFB0X+FDJiWc8zKJUjZ20V25cVg8oVBf9QIKEHKAURzXX1
 /+IHKKu8j3Z89meuYRmktgmgsz5pEKSbTQmItWVr9ZVc8z4jbSek32jbGVRjk0RUMIro=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0u2qY5VmW02QoZQQ8PVGB0RvEt+gYfighmeowfpBp9Q=; b=dgKVa9NdWJQo09yV6rbriH4tI7
 otkDK1op6LzyEqt6qhK0emJtDiN0qZmaraS0voWgvlXFpGVq1dI4QIZaA3YgmZc+IvQdHY+hVL3in
 uiok5uJT2P8VJFx7y8wSUvbcoxHxGKkJ7GLC3oGDBJ+Fqra9/ThgPQnCYPhEc1k4+TVM=;
Received: from smtpbgsg1.qq.com ([54.254.200.92])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t7b6D-0007Kt-RX for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 Nov 2024 13:57:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1730642209;
 bh=0u2qY5VmW02QoZQQ8PVGB0RvEt+gYfighmeowfpBp9Q=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=muhyYyK0z/NdZa8KFmMCW8T9BwlMCsF4yjdbFWjAmj4HAIVC0ACzI1W2JKVdwbxG+
 gN9SHRmkOD7n5XcJBmXnjKvdFRF2kNy3q2rr/hyePiPagsER9xBO8L6e3a/jmbPvIk
 K3pJjZPAj7U4V35+zGWecUYSP+uKQ+HJsegGbtAw=
X-QQ-mid: bizesmtpip2t1730641018t4vihmk
X-QQ-Originating-IP: OJFfFUb+TagDtWAwy6uc0+sLCBe0njxsmdHE22f+THA=
Received: from avenger-OMEN-by-HP-Gaming-Lapto ( [localhost])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sun, 03 Nov 2024 21:36:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 16809586154877906677
From: WangYuli <wangyuli@uniontech.com>
To: ebiggers@kernel.org
Date: Sun,  3 Nov 2024 21:36:55 +0800
Message-ID: <DA8BCDFFEACDA1C6+20241103133655.217375-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241025191454.72616-7-ebiggers@kernel.org>
References: <20241025191454.72616-7-ebiggers@kernel.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MAXRuxnbzssegXhSBUmiIE6Ni8PjKv5CHWWsGTJU0o95Ea/t2pd6wnqu
 av3bthBKz45tsWOf6m/LRZbQSWTt7BcsFHtEyxKQKiMG/UONhlRAE+jREH3dkz5J2RCrn3L
 EbNOGompESEmaKd/JRKrIWo8YjKuybwCcZoQbJlwZLKdyOeketSff2EOXVVi197Q11ABGJj
 zCDVLr5RahkoLwstEJ+vqFDa14JyI0DM16D2s1izf/JZoWOsYMuhDx5NAlzWweFxdxW8iJN
 VOIhEiUl/8dvJ/QXdQCUu2f5le0cqfUepm11FxRrjAo1Habnb4GSCzeWanGtE76dDAIzK89
 OY8bTcZrACgJJyaasaaeXrLkuWqajEX5KrRt8689iMb4z0Qty1MYQEUokgx/tVBRJYO7ePL
 dF2C2KFfnT1ZNm2JWJNccTgd/07en/sJl8LazlcZen1MBts3mA8V0YNF1Rdpkb4o/Y54qc3
 j8jDPxQhsdG9y72GOs4QMaPR1/fVv59RW+Xm+4sfr1yn2ZoFUme8u5u3kez4CvZ8Bdh8sfJ
 Y/dbxn8T25Lf8NWjJG2BvDKM8jSC7HAEJvGJKUItnpI8z7m5TEq2Y7PNear4vrh24uVr3dW
 9YhZYMHCMT4Juxx8eaSJg7r5WfqgSqOg3ark4Q2lLXWELJ8XxcjmniURpSeuQL4xpMELCiJ
 gDbVnykSObxsNor/pBnDXf3bK3KCNZFgxQNJtWkbgM5ScOyo73BbeExW6vzdv+8R9LELDiP
 tpiVn3b02RS2f+C79pak5W9FN56GtXmwY0F1LA3+ewf2qDy53ROjE6xLkhVZmVsXzpW15YJ
 9dPYVLJTZftDqtbbXCu4JW5OsrQUPJSiy8gE1wMdIolddx6iRYquGlS1V2EaWe6ofSQvdRu
 R/ksWoSGNU/P1X87cIITRGob5HcXmjUmG5183YZTYAMUsBn4B9ub/nQ9dwH7swW9vZK4Pn6
 sIAhRQ3rzG9Mxm+a6HLoaOYfkMD2LhuDprb8k4DagQ4WCLUiNRAJJjSPdh6CdSaZNOIda5s
 B+fiPygXfSsV4idJTf
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Even though the narrower CRC instructions doesn't require
 GRLEN=64, they still *aren't* part of LA32 (LoongArch reference manual v1.10, 
 Volume 1, Table 2-1). Link: https://lore.kernel.org/all/0a7d0a9e [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [54.254.200.92 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [54.254.200.92 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1t7b6D-0007Kt-RX
Subject: Re: [f2fs-dev] [PATCH v2 06/18] loongarch/crc32: expose CRC32
 functions through lib
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org,
 linux-scsi@vger.kernel.org, linux-mips@vger.kernel.org, chenhuacai@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel@xen0n.name, linux-crypto@vger.kernel.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-ext4@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, ardb@kernel.org,
 linux-arm-kernel@lists.infradead.org, xry111@xry111.site
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Even though the narrower CRC instructions doesn't require GRLEN=64, they still *aren't* part of LA32 (LoongArch reference manual v1.10, Volume 1, Table 2-1).
Link: https://lore.kernel.org/all/0a7d0a9e-c56e-4ee2-a83b-00164a450abe@xen0n.name/

Therefore, we could not directly add ARCH_HAS_CRC32 to config LOONGARCH.

Thanks,
--
WangYuli


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
