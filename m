Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 146EF72DA2D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jun 2023 08:52:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q8xsp-0004GI-Hz;
	Tue, 13 Jun 2023 06:52:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <heyunlei@oppo.com>) id 1q8xsn-0004G1-Qh
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jun 2023 06:52:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0cnYnUYn+reBDlVyKbG8j7mN7BTU+bYA3WTqU141Sf4=; b=R6R7tA3NeBOQUnIEyfr12E3OIZ
 jkHfOaORxCzVElhx5TmaVmRuLPG9liZYqRy8GX0wRScgl3AOmzTU39QpTGTxxgUmx9rpBFMu9ZIST
 p+VPnLCQzYjycnbymJyLsIsuhAhV+8PtF9eyL+e4k1VePntyxKKZY/rHBR0k6Eak7azc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0cnYnUYn+reBDlVyKbG8j7mN7BTU+bYA3WTqU141Sf4=; b=f
 yuRyeIHieQk/NpVNLHCIRNEhHcLQAHz3ZMHRKjXImdJA2UB+oyGgCd0ylohcMterhaw3T2MF/irci
 GdvH1Im9yTiRNIyqSWJIZbiYCFqEecxUDfDNBXukhJQpENRyfDu7zhaXWAiXFQ0xwILOglirz4ms6
 W6Rvpyi2F9XJKmAM=;
Received: from mail-psaapc01on2073.outbound.protection.outlook.com
 ([40.107.255.73] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q8xsl-0004bz-15 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jun 2023 06:52:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GknsSX0WKo1pEwcfOoZUMYK5eULAf1ROY+Figqxyd65FZ1qxC1xr93dvaUKlTS130Ih0AGo35TV/IWqECpyCEPvUZh2lBflqYzbEr1eS1g17y2wYv0Kqn2t5BHWEqSyaSJg/IXq2KYWAOz2NtGbqn3C30/C+0fzrH4jOuHYf5spA1hER7n2MBMMdddegc3KfDwmu+Wo6/aPFmaVkSFLfjDZNTBOcqwHzt1xwdD74zxqO3WF5JQYOWJLRqHBdemG+baiYj14edsUTtfUBeMRd7QIzKlyKetST1lNdke8kwV9HVb9SM365Rjw1d1Q0OC2ECoUPm5uQvUK3zScbGnYpMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cnYnUYn+reBDlVyKbG8j7mN7BTU+bYA3WTqU141Sf4=;
 b=IYoHWBmHF2vmdbjjhhJeaDPaLuFcq1Sz4tkQbA0UyHP43a0NLANSw4G7YSswXIrTj7Te5v0EJP6CCzcvzmyY92iA92J4AL0EISRMHa3zE7yzUpzKhBZ20JG+1vBeKrmFtfEZI3RBZyu6pPYXYyR9+Uqlnl1T9QtFKZWpZ6N6SAfKuTuXBd5VLVfeppH0i/TT0e+xBbD6hK7A1aq6jI2TF3yqXS06kIGe5y2O32RuIy5S7HNojknAisU548R52Ew3OYtWMUjAzgPfifsyMAUo1JdH6TmtdYbA000K9HhcFa1kzuPyokRqiV4leG0v7qxozetow2wpnVdsoEvpytulwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0cnYnUYn+reBDlVyKbG8j7mN7BTU+bYA3WTqU141Sf4=;
 b=YtIgwEezHu9ui/P5vnafz8eWmVPSDC2rZT66hL/prdqPpvehSIa0bmlMDCS9kShqTcZu571WlLsVBZxTEqBSQuPLTnws4m9epegWyGSXP9fa7lzrfHPIGCM1KsnZpjO9XBR5UecU6rDSLvT+T359VC+Af+iEWZjnF36EWl0UPUg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from TY2PR02MB4479.apcprd02.prod.outlook.com (2603:1096:404:800e::7)
 by TYZPR02MB4784.apcprd02.prod.outlook.com (2603:1096:400:53::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.21; Tue, 13 Jun
 2023 06:51:51 +0000
Received: from TY2PR02MB4479.apcprd02.prod.outlook.com
 ([fe80::bc4a:4d7a:4c73:76eb]) by TY2PR02MB4479.apcprd02.prod.outlook.com
 ([fe80::bc4a:4d7a:4c73:76eb%4]) with mapi id 15.20.6500.020; Tue, 13 Jun 2023
 06:51:51 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 13 Jun 2023 14:51:35 +0800
Message-Id: <20230613065135.3517335-1-heyunlei@oppo.com>
X-Mailer: git-send-email 2.40.1
X-ClientProxiedBy: SGXP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::20)
 To TY2PR02MB4479.apcprd02.prod.outlook.com
 (2603:1096:404:800e::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR02MB4479:EE_|TYZPR02MB4784:EE_
X-MS-Office365-Filtering-Correlation-Id: 99bb6fd2-28fc-4026-30c7-08db6bdaaa7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G/MMbL9dCjddun5vGFDvWdbkb/WAPcq3mH/u7Hn0ScSkwurmgV40vM+P+Oqlp+pp9xbeDYHzsEXcWblZhz4ApmFyKZMBCw4/J9KyfsrdKZ7KDFUP0nBhnrbyzma57CpmDmkjtKfvbgUsSaOFKBVZpnvja2EIGpZ/sNEH7rYxVCNE/xY38dNvTWqwYLwnaSHAXYHsoa6ZCm0uTBq9IhuP1qTWQL0gCUYQDLb0ws/xUy/jBdv/K9jjI0xnts7aGAxobuFISX6FUR8Qlt63r4NtlxXa2oEhFI6WmXTDwltb0eN044+y0HM8J7QTBQiYuyWSrV9yniERP50W2RWJyGf1yb8UtGLh5H2JEToH7os7jB+1UUlEvtuFEXs8NpVsHGEDwtSnkQQo32Wf7s4ZNgMflBuTj7yYBPZpS0JQQHusOQKAnAwCYDsmBA+Dwj8/KJXIuaNT5vr4J5zmH0u+58Q8FajhMEPvBTW1SQgDQz38mmJQSn3t6NBD1U43shKvijIaP1ZuIQRFjNmkn6SYr8TYxK5FQ7uX8WVwYRlch3aQR/CDLS08p256lP1aslij5sZM8ay0wURTFYhcQ5crnAUwzV9BHAmSZEC7SNyyEiBFu+FFglgHUAt2N0QBsNZoRygg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR02MB4479.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(39860400002)(136003)(346002)(366004)(451199021)(4326008)(66556008)(316002)(66476007)(41300700001)(186003)(2906002)(478600001)(8676002)(66946007)(8936002)(5660300002)(6666004)(52116002)(6486002)(107886003)(1076003)(6512007)(6506007)(26005)(83380400001)(36756003)(86362001)(2616005)(38350700002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EbvZ+ccLhMcVTbM1dBfX+cUqZAgqyW7q21sBU+8ABvfe4vVBxYyL1tcdK4I+?=
 =?us-ascii?Q?AKAd8OzeIyMZJ6OjZppG8rfLI4QYmWNd2PTMwFNO6CY3gIMcyNdxSIsaGpD9?=
 =?us-ascii?Q?J1XyrO79PsTc+KznmBMY3yhn/qja6V3ZdlUaRCUZW4sReUVFuwHwvlYNTTUz?=
 =?us-ascii?Q?7voe4/1TeicX8qEM9X/fO5+4eWTpZqYu/4vF5Vhrc5Fz+CBWjaG8KnVyNcUk?=
 =?us-ascii?Q?dIoAFjSpBfIBxCw+PWcWrHZfU4aN/e7+cnRCUq3bOKUTYDEbPp3ekmKXqRWx?=
 =?us-ascii?Q?PNXe7PbFzTZc+35H9n+018XPQvGD42acl6OSMCYZHzUk3RdcBBvE7UVlfBqQ?=
 =?us-ascii?Q?HCeTTB+X0ZY4D2Bww5X2+aWkEGE8tOKbBQYH3sSpS3GSNUx5Hj4SVmNklJ62?=
 =?us-ascii?Q?UEPFemoTQXA6oXfX6HNmXIhIbqPxVbGwULkOos3KZs/B/BBQNM+Tzm9xS8sb?=
 =?us-ascii?Q?GSYQSpU8JpKDAvtV6P4jswtBB8XY2B7wNi/ye0VrcjTAzSMLT2F2N6xKyAWo?=
 =?us-ascii?Q?K0AHXC3IB6ep4Zhw3hJo/koU0Wnx+YL+MNk/v7rQSvPUtYVW7LEXR6einQmp?=
 =?us-ascii?Q?yP0YN6Q27xBH9Jbt6pFJS/DSxYGWx3iqrqBsxYZpc4TUTWPTSe7E6u8RDa5s?=
 =?us-ascii?Q?DFrUNG5b8qSwtRc6kmGdZ17drFA7KmuF3ItQt8VzeYgkV16wVt96MoZEnMUp?=
 =?us-ascii?Q?RMPsnZTm5T1tnBPnbPCaUOvssEXWd9QE8KD2qXZ0Bp1I080HgrHbeLWhEdHB?=
 =?us-ascii?Q?v/PmoKvSrdevX2WIdu24g+kpnbvuMQe0k7Th+4QNeoKOkQXuEDGQvlfELCE3?=
 =?us-ascii?Q?ZH9QdRSzIuWK9xK0tWhuId485lBTI3Ze4ADZiv23KKboYTH5k0xMqFFO050c?=
 =?us-ascii?Q?ZoHCv8wXn6afx1UVi3nDcFNYbfQeIvSDjdNEA94FGDtpH8oPqbA7GXupW2mb?=
 =?us-ascii?Q?HxxNmz8p0fc25o+rcQB6mdIXsxVjcM6lwh5TDbPIViiH43QWfIFFSXemfV9N?=
 =?us-ascii?Q?fAcz4Z25sKU6xIbc1xpD4zZ9cZKIwgPUtuTfwbooHxUBobN4nWERTxsNwjZi?=
 =?us-ascii?Q?47rYM4omiqbDESK/zxO7PEc8j3lOWBX49ggrutxdfmgWDGfmvhQ2nvKtpRJs?=
 =?us-ascii?Q?nMm3qArrgOxRng/eVJ2YbURPhsA4dwREqooftuADxzFA6VDXidx813HVFKZP?=
 =?us-ascii?Q?kxWaQ+v2YuHFcC6g0p6u4DcbMfyC5dE2Fo5bQMWvhwVeaL+wG8bNTy2Y8Jlz?=
 =?us-ascii?Q?aZdS5D0/BANYMHFWh/D0PihbqiWtZdWNlavLZVCV2Jk6pnkWBkSJOD4/Rrma?=
 =?us-ascii?Q?H91kz8EZp5mg0GGu5G7/3F28uZ94ItMt4Mncb+bh/g4TUWm6HKgOqwyuL56c?=
 =?us-ascii?Q?9lYtkMJlavAahcGLmh4nBQuYkIAx75fuoAtEmEyJ2N1XOhauF4FGoOjzXS3a?=
 =?us-ascii?Q?xqVaJWpFdzEBAjLO22YX30qSOc6d8S3rq1Biw8SotXb7HJ41vznIFN3xO+k/?=
 =?us-ascii?Q?DuJV/2CaMB2OuG5xrVTsiqOjP1OsmhSeTZ0RwlZt1UBp4G7hfZte7Hz/6+xM?=
 =?us-ascii?Q?Cs0PJqHamV0OntHrsmokbpYtSQaOEpBlNw0pGfpL?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99bb6fd2-28fc-4026-30c7-08db6bdaaa7a
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB4479.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 06:51:51.2353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QF7qzz2nUheEmVfN+5QFic53PZIlSDBYymAC1YykvHZdeYAwpvxl9sksYH3tbK47UZ1P9mRe3aAVxkSjs1MK0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB4784
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch count mmap write io more accurately and remove
 redundant PageUptodate judgement in f2fs_vm_page_mkwrite. Signed-off-by:
 Yunlei
 He <heyunlei@oppo.com> --- fs/f2fs/file.c | 4 +--- 1 file changed,
 1 insertion(+), 3 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.73 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.73 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q8xsl-0004bz-15
Subject: [f2fs-dev] [PATCH] f2fs: count mmap write io more accurately
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
From: Yunlei He via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yunlei He <heyunlei@oppo.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

VGhpcyBwYXRjaCBjb3VudCBtbWFwIHdyaXRlIGlvIG1vcmUgYWNjdXJhdGVseSBhbmQgcmVtb3Zl
CnJlZHVuZGFudCBQYWdlVXB0b2RhdGUganVkZ2VtZW50IGluIGYyZnNfdm1fcGFnZV9ta3dyaXRl
LgoKU2lnbmVkLW9mZi1ieTogWXVubGVpIEhlIDxoZXl1bmxlaUBvcHBvLmNvbT4KLS0tCiBmcy9m
MmZzL2ZpbGUuYyB8IDQgKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxlLmMK
aW5kZXggNGRkNGUyYmQwMDBhLi4zNGE2MTc3YzY0YTQgMTAwNjQ0Ci0tLSBhL2ZzL2YyZnMvZmls
ZS5jCisrKyBiL2ZzL2YyZnMvZmlsZS5jCkBAIC0xNDksMTQgKzE0OSwxMiBAQCBzdGF0aWMgdm1f
ZmF1bHRfdCBmMmZzX3ZtX3BhZ2VfbWt3cml0ZShzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikKICAgICAg
ICAgICAgICAgIHplcm9fdXNlcl9zZWdtZW50KHBhZ2UsIG9mZnNldCwgUEFHRV9TSVpFKTsKICAg
ICAgICB9CiAgICAgICAgc2V0X3BhZ2VfZGlydHkocGFnZSk7Ci0gICAgICAgaWYgKCFQYWdlVXB0
b2RhdGUocGFnZSkpCi0gICAgICAgICAgICAgICBTZXRQYWdlVXB0b2RhdGUocGFnZSk7Cgorb3V0
X3NlbToKICAgICAgICBmMmZzX3VwZGF0ZV9pb3N0YXQoc2JpLCBpbm9kZSwgQVBQX01BUFBFRF9J
TywgRjJGU19CTEtTSVpFKTsKICAgICAgICBmMmZzX3VwZGF0ZV90aW1lKHNiaSwgUkVRX1RJTUUp
OwoKICAgICAgICB0cmFjZV9mMmZzX3ZtX3BhZ2VfbWt3cml0ZShwYWdlLCBEQVRBKTsKLW91dF9z
ZW06CiAgICAgICAgZmlsZW1hcF9pbnZhbGlkYXRlX3VubG9ja19zaGFyZWQoaW5vZGUtPmlfbWFw
cGluZyk7CgogICAgICAgIHNiX2VuZF9wYWdlZmF1bHQoaW5vZGUtPmlfc2IpOwotLQoyLjQwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9QUE8KCuacrOeUteWtkOmCruS7tuWP
iuWFtumZhOS7tuWQq+aciU9QUE/lhazlj7jnmoTkv53lr4bkv6Hmga/vvIzku4XpmZDkuo7pgq7k
u7bmjIfmmI7nmoTmlLbku7bkurrvvIjljIXlkKvkuKrkurrlj4rnvqTnu4TvvInkvb/nlKjjgILn
poHmraLku7vkvZXkurrlnKjmnKrnu4/mjojmnYPnmoTmg4XlhrXkuIvku6Xku7vkvZXlvaLlvI/k
vb/nlKjjgILlpoLmnpzmgqjplJnmlLbkuobmnKzpgq7ku7bvvIzliIfli7/kvKDmkq3jgIHliIbl
j5HjgIHlpI3liLbjgIHljbDliLfmiJbkvb/nlKjmnKzpgq7ku7bkuYvku7vkvZXpg6jliIbmiJbl
hbbmiYDovb3kuYvku7vkvZXlhoXlrrnvvIzlubbor7fnq4vljbPku6XnlLXlrZDpgq7ku7bpgJrn
n6Xlj5Hku7bkurrlubbliKDpmaTmnKzpgq7ku7blj4rlhbbpmYTku7bjgIIK572R57uc6YCa6K6v
5Zu65pyJ57y66Zm35Y+v6IO95a+86Ie06YKu5Lu26KKr5oiq55WZ44CB5L+u5pS544CB5Lii5aSx
44CB56C05Z2P5oiW5YyF5ZCr6K6h566X5py655eF5q+S562J5LiN5a6J5YWo5oOF5Ya177yMT1BQ
T+WvueatpOexu+mUmeivr+aIlumBl+a8j+iAjOW8leiHtOS5i+S7u+S9leaNn+WkseamguS4jeaJ
v+aLhei0o+S7u+W5tuS/neeVmeS4juacrOmCruS7tuebuOWFs+S5i+S4gOWIh+adg+WIqeOAggrp
maTpnZ7mmI7noa7or7TmmI7vvIzmnKzpgq7ku7blj4rlhbbpmYTku7bml6DmhI/kvZzkuLrlnKjk
u7vkvZXlm73lrrbmiJblnLDljLrkuYvopoHnuqbjgIHmi5vmj73miJbmib/or7rvvIzkuqbml6Dm
hI/kvZzkuLrku7vkvZXkuqTmmJPmiJblkIjlkIzkuYvmraPlvI/noa7orqTjgIIg5Y+R5Lu25Lq6
44CB5YW25omA5bGe5py65p6E5oiW5omA5bGe5py65p6E5LmL5YWz6IGU5py65p6E5oiW5Lu75L2V
5LiK6L+w5py65p6E5LmL6IKh5Lic44CB6JGj5LqL44CB6auY57qn566h55CG5Lq65ZGY44CB5ZGY
5bel5oiW5YW25LuW5Lu75L2V5Lq677yI5Lul5LiL56ew4oCc5Y+R5Lu25Lq64oCd5oiW4oCcT1BQ
T+KAne+8ieS4jeWboOacrOmCruS7tuS5i+ivr+mAgeiAjOaUvuW8g+WFtuaJgOS6q+S5i+S7u+S9
leadg+WIqe+8jOS6puS4jeWvueWboOaVheaEj+aIlui/h+WkseS9v+eUqOivpeetieS/oeaBr+iA
jOW8leWPkeaIluWPr+iDveW8leWPkeeahOaNn+WkseaJv+aLheS7u+S9lei0o+S7u+OAggrmlofl
jJblt67lvILmiqvpnLLvvJrlm6DlhajnkIPmlofljJblt67lvILlvbHlk43vvIzljZXnuq/ku6VZ
RVNcT0vmiJblhbbku5bnroDljZXor43msYfnmoTlm57lpI3lubbkuI3mnoTmiJDlj5Hku7bkurrl
r7nku7vkvZXkuqTmmJPmiJblkIjlkIzkuYvmraPlvI/noa7orqTmiJbmjqXlj5fvvIzor7fkuI7l
j5Hku7bkurrlho3mrKHnoa7orqTku6XojrflvpfmmI7noa7kuabpnaLmhI/op4HjgILlj5Hku7bk
urrkuI3lr7nku7vkvZXlj5fmlofljJblt67lvILlvbHlk43ogIzlr7zoh7TmlYXmhI/miJbplJno
r6/kvb/nlKjor6XnrYnkv6Hmga/miYDpgKDmiJDnmoTku7vkvZXnm7TmjqXmiJbpl7TmjqXmjZ/l
rrPmib/mi4XotKPku7vjgIIKVGhpcyBlLW1haWwgYW5kIGl0cyBhdHRhY2htZW50cyBjb250YWlu
IGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbiBmcm9tIE9QUE8sIHdoaWNoIGlzIGludGVuZGVkIG9u
bHkgZm9yIHRoZSBwZXJzb24gb3IgZW50aXR5IHdob3NlIGFkZHJlc3MgaXMgbGlzdGVkIGFib3Zl
LiBBbnkgdXNlIG9mIHRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaGVyZWluIGluIGFueSB3YXkg
KGluY2x1ZGluZywgYnV0IG5vdCBsaW1pdGVkIHRvLCB0b3RhbCBvciBwYXJ0aWFsIGRpc2Nsb3N1
cmUsIHJlcHJvZHVjdGlvbiwgb3IgZGlzc2VtaW5hdGlvbikgYnkgcGVyc29ucyBvdGhlciB0aGFu
IHRoZSBpbnRlbmRlZCByZWNpcGllbnQocykgaXMgcHJvaGliaXRlZC4gSWYgeW91IGFyZSBub3Qg
dGhlIGludGVuZGVkIHJlY2lwaWVudCwgcGxlYXNlIGRvIG5vdCByZWFkLCBjb3B5LCBkaXN0cmli
dXRlLCBvciB1c2UgdGhpcyBpbmZvcm1hdGlvbi4gSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyB0
cmFuc21pc3Npb24gaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVs
eSBieSByZXBseSBlLW1haWwgYW5kIHRoZW4gZGVsZXRlIHRoaXMgbWVzc2FnZS4KRWxlY3Ryb25p
YyBjb21tdW5pY2F0aW9ucyBtYXkgY29udGFpbiBjb21wdXRlciB2aXJ1c2VzIG9yIG90aGVyIGRl
ZmVjdHMgaW5oZXJlbnRseSwgbWF5IG5vdCBiZSBhY2N1cmF0ZWx5IGFuZC9vciB0aW1lbHkgdHJh
bnNtaXR0ZWQgdG8gb3RoZXIgc3lzdGVtcywgb3IgbWF5IGJlIGludGVyY2VwdGVkLCBtb2RpZmll
ZCAsZGVsYXllZCwgZGVsZXRlZCBvciBpbnRlcmZlcmVkLiBPUFBPIHNoYWxsIG5vdCBiZSBsaWFi
bGUgZm9yIGFueSBkYW1hZ2VzIHRoYXQgYXJpc2Ugb3IgbWF5IGFyaXNlIGZyb20gc3VjaCBtYXR0
ZXIgYW5kIHJlc2VydmVzIGFsbCByaWdodHMgaW4gY29ubmVjdGlvbiB3aXRoIHRoZSBlbWFpbC4K
VW5sZXNzIGV4cHJlc3NseSBzdGF0ZWQsIHRoaXMgZS1tYWlsIGFuZCBpdHMgYXR0YWNobWVudHMg
YXJlIHByb3ZpZGVkIHdpdGhvdXQgYW55IHdhcnJhbnR5LCBhY2NlcHRhbmNlIG9yIHByb21pc2Ug
b2YgYW55IGtpbmQgaW4gYW55IGNvdW50cnkgb3IgcmVnaW9uLCBub3IgY29uc3RpdHV0ZSBhIGZv
cm1hbCBjb25maXJtYXRpb24gb3IgYWNjZXB0YW5jZSBvZiBhbnkgdHJhbnNhY3Rpb24gb3IgY29u
dHJhY3QuIFRoZSBzZW5kZXIsIHRvZ2V0aGVyIHdpdGggaXRzIGFmZmlsaWF0ZXMgb3IgYW55IHNo
YXJlaG9sZGVyLCBkaXJlY3Rvciwgb2ZmaWNlciwgZW1wbG95ZWUgb3IgYW55IG90aGVyIHBlcnNv
biBvZiBhbnkgc3VjaCBpbnN0aXR1dGlvbiAoaGVyZWluYWZ0ZXIgcmVmZXJyZWQgdG8gYXMgInNl
bmRlciIgb3IgIk9QUE8iKSBkb2VzIG5vdCB3YWl2ZSBhbnkgcmlnaHRzIGFuZCBzaGFsbCBub3Qg
YmUgbGlhYmxlIGZvciBhbnkgZGFtYWdlcyB0aGF0IGFyaXNlIG9yIG1heSBhcmlzZSBmcm9tIHRo
ZSBpbnRlbnRpb25hbCBvciBuZWdsaWdlbnQgdXNlIG9mIHN1Y2ggaW5mb3JtYXRpb24uCkN1bHR1
cmFsIERpZmZlcmVuY2VzIERpc2Nsb3N1cmU6IER1ZSB0byBnbG9iYWwgY3VsdHVyYWwgZGlmZmVy
ZW5jZXMsIGFueSByZXBseSB3aXRoIG9ubHkgWUVTXE9LIG9yIG90aGVyIHNpbXBsZSB3b3JkcyBk
b2VzIG5vdCBjb25zdGl0dXRlIGFueSBjb25maXJtYXRpb24gb3IgYWNjZXB0YW5jZSBvZiBhbnkg
dHJhbnNhY3Rpb24gb3IgY29udHJhY3QsIHBsZWFzZSBjb25maXJtIHdpdGggdGhlIHNlbmRlciBh
Z2FpbiB0byBlbnN1cmUgY2xlYXIgb3BpbmlvbiBpbiB3cml0dGVuIGZvcm0uIFRoZSBzZW5kZXIg
c2hhbGwgbm90IGJlIHJlc3BvbnNpYmxlIGZvciBhbnkgZGlyZWN0IG9yIGluZGlyZWN0IGRhbWFn
ZXMgcmVzdWx0aW5nIGZyb20gdGhlIGludGVudGlvbmFsIG9yIG1pc3VzZSBvZiBzdWNoIGluZm9y
bWF0aW9uLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L2xpbnV4LWYyZnMtZGV2ZWwK
