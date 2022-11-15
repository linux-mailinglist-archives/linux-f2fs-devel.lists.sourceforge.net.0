Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A6A628E9A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Nov 2022 01:46:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ouk5Y-0001nc-1E;
	Tue, 15 Nov 2022 00:46:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yonggil.song@samsung.com>) id 1ouk5W-0001nR-P2
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Nov 2022 00:46:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:To:From:Sender:Reply-To:Subject:Mime-Version:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oj9e3eFsrbOoWOnn2DyErDzRa00Smme7Tym+p+M+iCY=; b=MUO3x9sfs3rCJqwB/iLQ5mtfjj
 QjB2jnUjX0AAfLzK+jAEGXas8KQaKwNoSe5cRcacXZxmi1DJmE6hN8q2NzBAhIiTVGO//9wS4tujh
 4FT+lKLm+/0II4g620OkksmZV8/ovKif1i+7xvBUb94hwW27TIiph8zBStKmvcqC1SN4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:To:From
 :Sender:Reply-To:Subject:Mime-Version:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=oj9e3eFsrbOoWOnn2DyErDzRa00Smme7Tym+p+M+iCY=; b=R
 WoIO48PNRKduiIyKeb+Uq1aSdaEvA9x2AEBJ25L/x94trVtmMemowLBlvVKNOPFrVatP+A/HkXQyU
 vuG39NRwFVmMbA0ZNNe1EjhpPOH815LWRRSBt9chZ9q6wZ5xzvt5/rPriHjzzqpPxQpgoL2isLl9W
 2aOC2I3jqOGm7MOs=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ouk5S-008XtH-Up for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Nov 2022 00:46:06 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20221115004551epoutp0421a0cf47e1e976a825e949f3e27a7503~nm33gi4GK0274002740epoutp04G
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 15 Nov 2022 00:45:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20221115004551epoutp0421a0cf47e1e976a825e949f3e27a7503~nm33gi4GK0274002740epoutp04G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1668473151;
 bh=oj9e3eFsrbOoWOnn2DyErDzRa00Smme7Tym+p+M+iCY=;
 h=Subject:Reply-To:From:To:Date:References:From;
 b=Q7q4bwiytu4Wt9I29sfAYtC0C75xdYYC9n28YjOnUDxAGdahjFSbvg5eXozRwLH3e
 WKsP/4FN+lrbUHH2iWCGCqOMdEO607YA74a70MjV6CNcTrBiSyYZTLgSsAbuL+Fk/e
 A1n5oSFznQcqV8RicpcW7wdHs2DO4ZMWG893MuSY=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20221115004551epcas2p4a757945b4465e7bf0120fd2083bc55cd~nm33L7WMh0862508625epcas2p4F;
 Tue, 15 Nov 2022 00:45:51 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.92]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4NB6t66nQ5z4x9Pq; Tue, 15 Nov
 2022 00:45:50 +0000 (GMT)
X-AuditID: b6c32a48-64bff7000001494a-0d-6372e13eb9bc
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 F8.68.18762.E31E2736; Tue, 15 Nov 2022 09:45:50 +0900 (KST)
Mime-Version: 1.0
From: Yonggil Song <yonggil.song@samsung.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20221115004550epcms2p7cf1a6312fd35de690ba52304390cbfee@epcms2p7>
Date: Tue, 15 Nov 2022 09:45:50 +0900
X-CMS-MailID: 20221115004550epcms2p7cf1a6312fd35de690ba52304390cbfee
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBKsWRmVeSWpSXmKPExsWy7bCmma7dw6Jkg8+/TC1OTz3LZPFk/Sxm
 i0uL3C0u75rDZjH1/BEmB1aPTas62Tx2L/jM5NG3ZRWjx+dNcgEsUdk2GamJKalFCql5yfkp
 mXnptkrewfHO8aZmBoa6hpYW5koKeYm5qbZKLj4Bum6ZOUBrlRTKEnNKgUIBicXFSvp2NkX5
 pSWpChn5xSW2SqkFKTkF5gV6xYm5xaV56Xp5qSVWhgYGRqZAhQnZGfvnP2Yv+C9ZMf3Af/YG
 xpWSXYycHBICJhI7O26ydjFycQgJ7GCU2LZ3FWMXIwcHr4CgxN8dwiA1wgL+EjPOH2QBsYUE
 lCSuHehlgYjrS2xevIwdxGYT0JX4u2E5mC0i8IpR4sxqUYj5vBIz2p+yQNjSEtuXb2WEsDUk
 fizrZYawRSVurn7LDmO/PzYfqkZEovXeWagaQYkHP3dDxSUlFh06zwRh50v8XXGdDcKukdja
 0AYV15e41rGRBeIVX4knN4xAwiwCqhKH73yEWuUi8fPRIlYQm1lAW2LZwtfMIOXMApoS63fp
 g5gSAsoSR26xQFTwSXQc/ssO89SOeU+gFqlJbN60mRXClpG48LgN6kgPifsfbjFDAi1Q4vXM
 GewTGOVnIYJ2FpK9sxD2LmBkXsUollpQnJueWmxUYAKPzeT83E2M4CSn5bGDcfbbD3qHGJk4
 GA8xSnAwK4nwzpPJTxbiTUmsrEotyo8vKs1JLT7EaAr08URmKdHkfGCazSuJNzSxNDAxMzM0
 NzI1MFcS5+2aoZUsJJCeWJKanZpakFoE08fEwSnVwNR0REh5aZ/SrvOFmf/jU3R8r+4Ujq07
 s/igRJbmh/tsHFscJSat22UecLJFN0L4+CRdDZtnfPaLF/Wxa97P9Xqq8o6vfaVD+UqRN8fv
 sa9buLMnk/n67KybMyyLZxdJTLh9qmT2XQ4O56oVa9Nmru9McLp+t6PHQldp5ozvufXNp/wn
 Hry0Y3GNtVrklgT1VSciNnT75pn4BN619+7+53Y3tPpJ43z9BZk+B+/FtF++uTVgV6qDWsbv
 g865q25caJ7xfu/iu9aZrOt7TH1VDgr5LvTbITHvy5ujnS++FJh9+cUvHRu1+W+rB0djlKbn
 5MDLa2on8Jy4HWy4Y6bo61f30neKb+nmPFXsoFGzLVOJpTgj0VCLuag4EQDnaQc4+wMAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20221102100756epcms2p23dfabe90c467313ce094c5c81a99c6d7
References: <CGME20221102100756epcms2p23dfabe90c467313ce094c5c81a99c6d7@epcms2p7>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  When f2fs chooses GC victim in large section & LFS mode,
    next_victim_seg[gc_type] is referenced first. After segment is freed,
    next_victim_seg[gc_type] has the next segment numbe [...] 
 
 Content analysis details:   (-3.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [203.254.224.34 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [203.254.224.34 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ouk5S-008XtH-Up
Subject: [f2fs-dev] [PATCH v1] f2fs: avoid victim selection from previous
 victim section
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
Reply-To: yonggil.song@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

V2hlbsKgZjJmc8KgY2hvb3Nlc8KgR0PCoHZpY3RpbcKgaW7CoGxhcmdlwqBzZWN0aW9uwqAmwqBM
RlPCoG1vZGUsDQpuZXh0X3ZpY3RpbV9zZWdbZ2NfdHlwZV3CoGlzwqByZWZlcmVuY2VkwqBmaXJz
dC7CoEFmdGVywqBzZWdtZW50wqBpc8KgZnJlZWQsDQpuZXh0X3ZpY3RpbV9zZWdbZ2NfdHlwZV3C
oGhhc8KgdGhlwqBuZXh0wqBzZWdtZW50wqBudW1iZXIuDQpIb3dldmVyLMKgbmV4dF92aWN0aW1f
c2VnW2djX3R5cGVdwqBzdGlsbMKgaGFzwqB0aGXCoGxhc3TCoHNlZ21lbnTCoG51bWJlcg0KZXZl
bsKgYWZ0ZXLCoHRoZcKgbGFzdMKgc2VnbWVudMKgb2bCoHNlY3Rpb27CoGlzwqBmcmVlZC7CoElu
wqB0aGlzwqBjYXNlLMKgd2hlbsKgZjJmcw0KY2hvb3Nlc8KgYcKgdmljdGltwqBmb3LCoHRoZcKg
bmV4dMKgR0PCoHJvdW5kLMKgdGhlwqBsYXN0wqBzZWdtZW50wqBvZsKgcHJldmlvdXPCoHZpY3Rp
bQ0Kc2VjdGlvbsKgaXPCoGNob3NlbsKgYXPCoGHCoHZpY3RpbS4NCg0KSW5pdGlhbGl6ZcKgbmV4
dF92aWN0aW1fc2VnW2djX3R5cGVdwqB0b8KgTlVMTF9TRUdOT8KgZm9ywqB0aGXCoGxhc3TCoHNl
Z21lbnTCoGluDQpsYXJnZcKgc2VjdGlvbi4NCg0KU2lnbmVkLW9mZi1ieTrCoFlvbmdnaWzCoFNv
bmfCoDx5b25nZ2lsLnNvbmdAc2Ftc3VuZy5jb20+DQotLS0NCsKgZnMvZjJmcy9nYy5jwqB8wqA1
wqArKystLQ0KwqAxwqBmaWxlwqBjaGFuZ2VkLMKgM8KgaW5zZXJ0aW9ucygrKSzCoDLCoGRlbGV0
aW9ucygtKQ0KDQpkaWZmwqAtLWdpdMKgYS9mcy9mMmZzL2djLmPCoGIvZnMvZjJmcy9nYy5jDQpp
bmRleMKgNDU0NmUwMWIyZWUwLi4xMDY3N2Q1M2VmMGXCoDEwMDY0NA0KLS0twqBhL2ZzL2YyZnMv
Z2MuYw0KKysrwqBiL2ZzL2YyZnMvZ2MuYw0KQEDCoC0xNzQ0LDjCoCsxNzQ0LDnCoEBAwqBzdGF0
aWPCoGludMKgZG9fZ2FyYmFnZV9jb2xsZWN0KHN0cnVjdMKgZjJmc19zYl9pbmZvwqAqc2JpLA0K
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgZ2V0X3ZhbGlkX2Jsb2NrcyhzYmkswqBzZWdubyzCoGZhbHNlKcKgPT3CoDApDQrC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNlZ19mcmVl
ZCsrOw0KwqANCi3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmwqAoX19pc19sYXJn
ZV9zZWN0aW9uKHNiaSnCoCYmwqBzZWdub8KgK8KgMcKgPMKgZW5kX3NlZ25vKQ0KLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNiaS0+bmV4dF92aWN0aW1f
c2VnW2djX3R5cGVdwqA9wqBzZWdub8KgK8KgMTsNCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGlmwqAoX19pc19sYXJnZV9zZWN0aW9uKHNiaSkpDQorwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc2JpLT5uZXh0X3ZpY3RpbV9zZWdbZ2NfdHlw
ZV3CoD0NCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgKHNlZ25vwqArwqAxwqA8wqBlbmRfc2Vnbm8pwqA/wqBzZWdub8KgK8Kg
McKgOsKgTlVMTF9TRUdOTzsNCsKgc2tpcDoNCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBmMmZzX3B1dF9wYWdlKHN1bV9wYWdlLMKgMCk7DQrCoMKgwqDCoMKgwqDCoMKgwqB9DQot
LcKgDQoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9saW51eC1mMmZzLWRldmVsCg==
