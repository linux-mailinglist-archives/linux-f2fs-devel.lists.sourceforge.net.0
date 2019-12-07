Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1C8115BCA
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  7 Dec 2019 11:11:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1idX3J-0000Ri-QW; Sat, 07 Dec 2019 10:11:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <glqhw@qq.com>) id 1idX3F-0000PQ-HM
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 07 Dec 2019 10:11:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:Date:Content-Transfer-Encoding:
 Content-Type:Mime-Version:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sNeVoIvhIh3os80f6nmYqsFqGSqj0Bc0AMIDaUei+wg=; b=MunqFWhd3KAkCCz0uxUMx51FgH
 FjvRCm4hTqZXYMyobX6CwBfWa8xbPeklQbiZX3wvrvAzwqgKR3hAxYW6ntnoybm6sArnLEHpPA1n7
 z0YIA9miOW69uiYa4uaHA4j0p8hTrR6bqGD4zhJ0/k/esvXoccLaPMCAHAO4Rw8g0Xmc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-ID:Date:Content-Transfer-Encoding:Content-Type:Mime-Version:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=sNeVoIvhIh3os80f6nmYqsFqGSqj0Bc0AMIDaUei+wg=; b=U
 x9C1KlPqOetgjpd2Goe5mdce7KFzgXYGDPU7ubflD+tvLzHWYkq7LnJZjwY7ovLuv3TJBjD7xpvRA
 OX51Ub/l3Q6uGAdrUKc6EILB/aNgGQg90n5N4b+vLORFWI+WDyHgjLHRBh/8LEbQ9UR35otrO2BmW
 WrPqQV/kRNARHUow=;
Received: from smtpbguseast2.qq.com ([54.204.34.130])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1idX3A-00CTBZ-Qx
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 07 Dec 2019 10:11:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1575713448; bh=sNeVoIvhIh3os80f6nmYqsFqGSqj0Bc0AMIDaUei+wg=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=eeZ9d/dK/SieIewK1yT9bwHPiNmMDjJzgmjrbKle/n5cti941Xy/brtqmtNEYISIu
 WLTMC7F2btZaVcho1aD9ui3qDnFKN87Mwkv/QyVIgi0XLCr+GtoXj9k8YcL58nT1Eq
 c0z8g7Y9fiQf/gfCmCEPOq16kqANGVOx+ZQAXWRs=
X-QQ-FEAT: EUGmOqWjSYJ09B2JmuhBNWD0e+2jXfs/yvSZAAsWOfFaB0I1HTAh7OvOYl8Wx
 WSY5O2oiZdvz8whp2CyMI+gvV33WurqfbkfCngiw8YpRjdakIllFKSOLCAAwOQHRpYqT2Do
 rQ9clurJdji3/ITXWBX7FTC1lWetCLxY2b7l10LUQXnpdrM5c9TDzh8AaUp4HwRWg6GZtgL
 aYXMj2zJpS/EQigCnfX35But0nZCixor8Ua5HOSZacw3ColB3jGE7X4mhxvb4hSNTW6bWhw
 lxg4EwZS5uHoCkNT5+fgnR+T8JfjMjNN9mRA==
X-QQ-SSF: 00000000000000F000000000000000Z
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 115.156.164.146
X-QQ-STYLE: 
X-QQ-mid: webmail804t1575713447t2801590
From: "=?gb18030?B?uuzJ1bXEzf67r7H9?=" <glqhw@qq.com>
To: "=?gb18030?B?bGludXgtZjJmcy1kZXZlbA==?="
 <linux-f2fs-devel@lists.sourceforge.net>
Mime-Version: 1.0
Date: Sat, 7 Dec 2019 18:10:47 +0800
X-Priority: 3
Message-ID: <tencent_0B38BD6C2739091DE8A052D6D772D1DEAA06@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Sat, 07 Dec 2019 18:10:48 +0800 (CST)
Feedback-ID: webmail:qq.com:bgforeign:bgforeign11
X-QQ-Bgrelay: 1
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (glqhw[at]qq.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [54.204.34.130 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: usenix.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1idX3A-00CTBZ-Qx
Subject: [f2fs-dev]  Potential data corruption?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi F2FS experts,
The following confuses me:

A typical fsync() goes like this:
1) Issue data block IOs
2) Wait for completion
3) Issue chained node block IOs
4) Wait for completion
5) Issue flush command

In order to preserve data consistency under sudden power failure, it requires that the storage device persists data blocks prior to node blocks.
Otherwise, under sudden power failure, it's possible that the persisted node block points to NULL data blocks.

However, according to this study (https://www.usenix.org/conference/fast18/presentation/won), the persistent order of requests doesn't necessarily equals to the request finish order (due to device volatile caches). This means that its possible that the node blocks get persisted prior to data blocks.

Does F2FS have other mechanisms to prevent such inconsistency? Or does it require the device to persist data without reordering?

Thanks!

Hongwei
_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
