Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C3706914F9C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jun 2024 16:11:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sLkPS-0003T1-2k;
	Mon, 24 Jun 2024 14:11:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sLkPQ-0003So-QG
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jun 2024 14:11:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w6fxcWA0sbaYv8uaJufgXMhBumGTwRyITQA5KBTuja0=; b=Yz40htssiWhp3ILVPUJ2QmZ2+N
 mWmgfqHh8b/p2BZoNHvmf3EVW213AbHQSzPhdQF91qIpaGDlc7CzaZmsbIG2CO4z5et7tJqaIex8a
 AKP3W4CbtJ53MtpaSXtafJv/qKZrREaemJ9PviiVDDS+rl0BGYbNnQuG30THLnAfy2Mc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=w6fxcWA0sbaYv8uaJufgXMhBumGTwRyITQA5KBTuja0=; b=gczS2fDDdIebLfrXUYsYD4iZcF
 2dNnNcGBBcjEgw6/6Zd8t9Xk7J7c3bXZgCE1V1pzvtJMAZ6vAyi0l0zUQkxs+JMVAP1r10I3S/vzL
 cp+0ouzTQX0qmF6IIUkTCHmOw28GUSWytQU7+AZI5FyXweMnwRbt0zKsMywY08dv/E0A=;
Received: from mail-tyzapc01on2057.outbound.protection.outlook.com
 ([40.107.117.57] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sLkPQ-0002nE-Cr for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jun 2024 14:11:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LAMTllvmTCT3WUoMStP8Pr1yDITLklrVmpNQUmGEiYqn0MMD8tL7I5nxfOJXo0oEZK3nHeqeMnYLL1ZruzLe6ojaThl3R6ONbyJy1k19ouVci+R7V4hyE5H7l8v/X/dOEwctVQyYdJ/xSnsz3DzQUCj5dPci0hjhdL0u9v25ZJqiO3Jf/VyKJlWQAwlIbmdq+z10N2nw3kRwzj3PCK7j85tk31z37L+7NPKbnkI5zROdRuZAh6ZKh219ucXpSYfXKZTuZdX0n0Ekg/3YarmNOSNWcjtAUwcbNkq9XEt2PNNhcApr9hljPmsuVO3ErVT0tS4ucAV2na0QhqEeoHhelw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w6fxcWA0sbaYv8uaJufgXMhBumGTwRyITQA5KBTuja0=;
 b=FT869X1wV/lSCDbYkHfLdnd2fT4onTBzQB3VE1DW5eBdGLNQTapj6K79UiB35Fnv6xesma43VOPAmmxVT3+yunJnvoqfBLKgL7inP9vhpmmRYYKNSInNzkXSv+KGU4xw6iPrtWCUoricN34Yx7YgmX0vQdFB8MHZUiZwrIKMkagBl8MA9OMxm6qHWHm+ayjkNLAU1tHSTlGUvfvl5bsupPJBSKwJUwNkK5zqs4+HXJXiLDZj4if9+Nf/teNZq0EynvnTXWinAAthRb/MK/nAnIHsbRb7YMsPpdKIPgXcAKsKCkP5vjcza/ynLFpLSSLWq3dU9IbFrWCE7HKBVaOBpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6fxcWA0sbaYv8uaJufgXMhBumGTwRyITQA5KBTuja0=;
 b=A08TnSI4Ytdh6tYaaceh1yp/OU8WKNSHTbi2ZS10i8y4NKp/QUt9rZ1F8nsM1UsP8nTi5G90dGEjEbCFhwn/ZdGvE2HzG/US+9nYaVS6pVp2vfVdcO4JwOoCKe8bESCHjBrtbS2l+vRiLYtU2gizB/Xh1Ei2fJ5LF8NL36fYocc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by PUZPR02MB6233.apcprd02.prod.outlook.com (2603:1096:301:f7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Mon, 24 Jun
 2024 13:55:58 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7677.033; Mon, 24 Jun 2024
 13:55:58 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Mon, 24 Jun 2024 21:55:27 +0800
Message-Id: <20240624135532.3330136-5-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240624135532.3330136-1-shengyong@oppo.com>
References: <20240624135532.3330136-1-shengyong@oppo.com>
X-ClientProxiedBy: SI2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::7)
 To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|PUZPR02MB6233:EE_
X-MS-Office365-Filtering-Correlation-Id: c2c48219-90ec-4ed0-4641-08dc94555fee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|366013|52116011|376011|1800799021|38350700011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sAAeuwx5NJzGbtM/DwVbTjeBQqcKrKnYhQo5iqlhoHcM+HFByVVG8Z3jKYFe?=
 =?us-ascii?Q?aP8N6C416zUDdTm+PqEimY3kWraObYSaodGrl9lv7A3NjE+Ye77rbG4ubk6r?=
 =?us-ascii?Q?Cm0tXFLPods/jyKsSizXWUCNfOx3dAicQVlSY5qQ5laTty+n0KDcxaeTOu9V?=
 =?us-ascii?Q?INT5I2DA6zfQgqxzGDORUKI1mbjCRPd7DPfNUUfnyXYROuEzzg7X//5vuUIE?=
 =?us-ascii?Q?h5WkCDTF8Tt3ZIKIL5vvTaThNwJYyfG5o6vq17BFTKSnxigTgxS2ipAkoF1l?=
 =?us-ascii?Q?8Qvw+tcASSTt6ULhvSw3XqZsovb0zYBtf96eDuuOHwy7a9fO7sg/tCg1TEgc?=
 =?us-ascii?Q?HdEGImbJ5z2C5fe2wFJFcRbFJkIIS0y9oFRdZ7TUxdsowsFdr26RMIJgJekW?=
 =?us-ascii?Q?+hzbPIzz0OLCFd1sCKLrDKeyfgU8yh6AGgl4vh48M3wSE4Bn2k5B3yA/fTas?=
 =?us-ascii?Q?q4cmtYBH8lzZ1i3nbnwdsjXbhgIl0wQy9XWraU8z27GlQ6X833ypUOTcSE/k?=
 =?us-ascii?Q?GEeztl5RDnOquHkHyHAqq7aVE2zsU7DaOknL5nqgpYsLf73WhlqRpf/9oe8r?=
 =?us-ascii?Q?Nw+KROhP125Afmr4KMeIY5ovX7ed38eXGkiz2bmT1fym5fPZCJLZ+AY43fdQ?=
 =?us-ascii?Q?jg61YW1WE6aWHNeSpjMrJBnlS4WUDVPeF+uy0e6x/XuJXCSsrGvsF1hsgA08?=
 =?us-ascii?Q?DijDuCiEROUeilmxlD+VX6Sko4+ji5ajXRaizlPRkYeMbVt7dgSAXAtjwwv+?=
 =?us-ascii?Q?gCwhyjTphLcDBivDJMhnlB/6MJHCjwMkVISC4PG8ZsAPFFEIljMRihcOV002?=
 =?us-ascii?Q?BXwnzhINQqQ5gOvy5HKhyLewr3yQhiLvoDNadgoPhKBTMBq82fRgOAcVsmmh?=
 =?us-ascii?Q?ZtCXGkm4blceG2GfJgo+Xpk0HAy7uedQ6PDI+8QIEtY7C+qCQ8hXHpK6gZM1?=
 =?us-ascii?Q?ZVYv43ruAr1ZQfMz/gw2WrkmXRimf2lYhIQpOtM8J6KhHPTbZ6zp4dpjOBNh?=
 =?us-ascii?Q?iUAW3/uE2/T41AlkP4Y8rBVpUC4g5/kN3M7BhzO7i0pUvMhYSj8UDHveaXC+?=
 =?us-ascii?Q?jI6T4dtY8XfCIj7fVdcRe25v4AOxLNruoRibzSeJXQzEyyRiGVDQGb4LjXTJ?=
 =?us-ascii?Q?DQ3t/gmsPdigCfRXmkCzySfEmAbR5OXt7aAqxEBGTh5tp02kSVnI5345EZNO?=
 =?us-ascii?Q?u9OUEBCTx+uzAW96Xovci0HT0T8yu2ZvOwmESGgHvvL4by9h+joDLM22/eyx?=
 =?us-ascii?Q?mBor94mFPMzTps4hH+phi1lRNnoJt/qlccp6HPes5VRYXYvM+esF3IHw+Ow2?=
 =?us-ascii?Q?U8y7MDloo/WetmS0uyV2Hmkr0pUBjPpjf6kdidXrI9iHtVwlsXA8kLd8KXpy?=
 =?us-ascii?Q?knYzHDo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(52116011)(376011)(1800799021)(38350700011); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jBhDljdYBAAr01e3p1/obHAVpm7MNykDI1cnKxn6GkDop+JEKKSMHbVngO+D?=
 =?us-ascii?Q?CCvoE/MuQQgGF3+KXCNBDARidOd6Clcj2AAUrx+jtqRtYAylNbRzoeHI7Un5?=
 =?us-ascii?Q?1TcPDRft8o652vFbc8iijsyoQpq8e5wevm9DgGnnulc9xZ2fchVoSXHe9Mqo?=
 =?us-ascii?Q?y0q5BI3ZwM50nlqrXlwccOdJl9+Nm2xBSuZiPJKf/gEaVtETwkZTHPO4Y5PY?=
 =?us-ascii?Q?ERobk8zspzoymaAef7XPb+79xua/YrkkwuU2BnEAfgpFva1wPqJYY8ECmLrZ?=
 =?us-ascii?Q?9fyRADwa6MPz2HlM6V5G1PNdJjmuLpm767mklu8Ys5Oh8E4uuTe09u11tzKe?=
 =?us-ascii?Q?l+C12jFWINtrvlPMkEQAKQmAWcxuiHWSiIHF4qpgyJWBOUK68sIb0qdPZpJu?=
 =?us-ascii?Q?NFMaGtwu0Fukg6s9TodkacOLqiAePNsins0hmKoyGKZDrtBX/IJAkU1skSh/?=
 =?us-ascii?Q?E6U9EyZIDd2xrI3qKEtMJIne1o9pRAxhYYBfbgTjF0SZrOLKrchBJpRwYitr?=
 =?us-ascii?Q?Q6YGU96XILPzwPMXVzakF6SBPYAMwKQXQB/SUa4uMMlRU+LtlwKSLDweEvI9?=
 =?us-ascii?Q?XkkYk2I46cb9m/6fJ5/2ZiexxainBAS8jKQpsJPAZ50AMFsr6j97Beqew6+Y?=
 =?us-ascii?Q?zaLngQmwQvRXkLWmBvqO6o43HI5D5TICRgB8ZRmPvWs6moDechzlrC4OIILM?=
 =?us-ascii?Q?WX+dTw+b2ulVGdH1WHhNcx9cLK/6roBs4ZTh3+CmfgyEnojDBwqSbVGeXNsC?=
 =?us-ascii?Q?rJD1iLBGGvvTvV8EQsu5uqIae5l/Uw9hN9NoyqbxbFf6FQGYR3SRoNGbGYCN?=
 =?us-ascii?Q?G32hE7jdsvMrzRsKfelYcNB+BJHlVtGrEMCpYtD7uxLZF8VXj+HOg28Fg479?=
 =?us-ascii?Q?Up6sXwV062i1cKBzEVs0zq9h9gnN7I10BI2W1WsmETdFDLwnQ60o06eeY/SY?=
 =?us-ascii?Q?x8PAyps8IIwMGpyzcrzKZB5qdFUcRhqhWP5cc6TU0DpflB3JnpgF/VgoKPRt?=
 =?us-ascii?Q?lTV79x22XtO57NxWBFgIKCUFsMxlSmGYlBmoohOw2jQaU+I3qPP5x8vv0qQv?=
 =?us-ascii?Q?ht8v4CQ5xbkFytFTWi26YTMhb5SV0rQR+8ipBjW0toB1c574cV236kB5k+nl?=
 =?us-ascii?Q?C13+NHFY+XSUDymeZO9BRrqg8oBlUJxlE3NiVs/YIdjdktY7Jb217WQ2iEpc?=
 =?us-ascii?Q?tesLRUVjH3nF+EGFHb6EktT8X3Q5FNX2ek/FWRfbRJVS9YGyuJbkw/7p8ndm?=
 =?us-ascii?Q?vtk0+qCIygL8REK9SGk/fqGeXNRS4ziTmNS+UCJNhNeSuMipZn3kCRYLWyb9?=
 =?us-ascii?Q?3hBl2btg7G1cwGaJvz+214y2ILJfAffYKd8D6AH4vFh0Sx4L3fC5uKPRPZFE?=
 =?us-ascii?Q?uoT/Bz31zXCTY7gL0QZ3dA4FBFcj8n5cFx9AxrCX/b4UBubQC+l+kdAJMvuV?=
 =?us-ascii?Q?FvVoz6mFbBuOvDuITp7swl7DPGAm0Zksnd1yzk++8ZgI4Vp7W43R0X4bD8R0?=
 =?us-ascii?Q?+xbuFzSy31wGVt4KIMVdNujcM7s40nE1wG6C2Peq3C3HMtzs0OocbhatUh1R?=
 =?us-ascii?Q?GHY2pDmPjAYkbJ0abzECuhyv9s3cS5smKPdyQ7qp?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2c48219-90ec-4ed0-4641-08dc94555fee
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 13:55:58.5250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v5qLabKicXKAcbgx7KVhLgEIMcreZSzLA/SXFU7K12WrLL1jfckasiz6/9AzhSf7+Hv/4szrDy+5NjrXzkTzzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR02MB6233
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch enables injecting checkpoint. To archive this,
 a helper update_checkpoint() is added to write specific cp. And
 print_ckpt_info()
 is exported to show new checkpoint info. The meanings of options are: * cp:
 means cp is injected, its argument chooses which cp pack to be injected,
 where 0 means the current valid cp is choosen automatically. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.57 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.57 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.57 listed in wl.mailspike.net]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [40.107.117.57 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1sLkPQ-0002nE-Cr
Subject: [f2fs-dev] [RFC PATCH 04/10] inject.f2fs: add cp injection
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
From: Sheng Yong via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sheng Yong <shengyong@oppo.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch enables injecting checkpoint. To archive this, a helper
update_checkpoint() is added to write specific cp. And print_ckpt_info()
is exported to show new checkpoint info.

The meanings of options are:
 * cp: means cp is injected, its argument chooses which cp pack to be
       injected, where 0 means the current valid cp is choosen
       automatically.

The members could be injected in cp contains:
 * checkpoint_ver: checkpoint version
 * ckpt_flags: checkpoint flags
 * cur_node_segno: cur_node_segno array
 * cur_node_blkoff: cur_node_blkoff array
 * cur_data_segno: cur_data_segno array
 * cur_data_blkoff: cur_data_blkoff array

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/fsck.h   |   2 +
 fsck/inject.c | 124 ++++++++++++++++++++++++++++++++++++++++++++++++++
 fsck/inject.h |   1 +
 fsck/main.c   |   1 +
 fsck/mount.c  |   6 +++
 5 files changed, 134 insertions(+)

diff --git a/fsck/fsck.h b/fsck/fsck.h
index 4ca75b3..381dc9c 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -236,12 +236,14 @@ extern int find_next_free_block(struct f2fs_sb_info *, u64 *, int, int, bool);
 extern void duplicate_checkpoint(struct f2fs_sb_info *);
 extern void write_checkpoint(struct f2fs_sb_info *);
 extern void write_checkpoints(struct f2fs_sb_info *);
+extern void update_checkpoint(struct f2fs_sb_info *, int);
 extern void update_superblock(struct f2fs_super_block *, int);
 extern void update_data_blkaddr(struct f2fs_sb_info *, nid_t, u16, block_t,
 			struct f2fs_node *);
 extern void update_nat_blkaddr(struct f2fs_sb_info *, nid_t, nid_t, block_t);
 
 extern void print_raw_sb_info(struct f2fs_super_block *);
+extern void print_ckpt_info(struct f2fs_sb_info *);
 extern bool is_checkpoint_stop(struct f2fs_super_block *, bool);
 extern bool is_inconsistent_error(struct f2fs_super_block *);
 extern pgoff_t current_nat_addr(struct f2fs_sb_info *, nid_t, int *);
diff --git a/fsck/inject.c b/fsck/inject.c
index 1d40b72..e7ec329 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -23,6 +23,7 @@ void inject_usage(void)
 	MSG(0, "  --str <new string> new string to set\n");
 	MSG(0, "  --idx <slot index> which slot is injected in an array\n");
 	MSG(0, "  --sb <0|1|2> --mb <name> [--idx <index>] --val/str <value/string> inject superblock\n");
+	MSG(0, "  --cp <0|1|2> --mb <name> [--idx <index>] --val <value> inject checkpoint\n");
 	MSG(0, "  --dry-run do not really inject\n");
 
 	exit(1);
@@ -42,6 +43,22 @@ static void inject_sb_usage(void)
 	MSG(0, "  devs.path: inject path in devs array selected by --idx <index> specified by --str <string>\n");
 }
 
+static void inject_cp_usage(void)
+{
+	MSG(0, "inject.f2fs --cp <0|1|2> --mb <name> [--idx <index>] --val <value> inject checkpoint\n");
+	MSG(0, "[cp]:\n");
+	MSG(0, "  0: auto select the current cp pack\n");
+	MSG(0, "  1: select the first cp pack\n");
+	MSG(0, "  2: select the second cp pack\n");
+	MSG(0, "[mb]:\n");
+	MSG(0, "  checkpoint_ver: inject checkpoint_ver\n");
+	MSG(0, "  ckpt_flags: inject ckpt_flags\n");
+	MSG(0, "  cur_node_segno: inject cur_node_segno array selected by --idx <index>\n");
+	MSG(0, "  cur_node_blkoff: inject cur_node_blkoff array selected by --idx <index>\n");
+	MSG(0, "  cur_data_segno: inject cur_data_segno array selected by --idx <index>\n");
+	MSG(0, "  cur_data_blkoff: inject cur_data_blkoff array selected by --idx <index>\n");
+}
+
 int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 {
 	int o = 0;
@@ -54,6 +71,7 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 		{"val", required_argument, 0, 4},
 		{"str", required_argument, 0, 5},
 		{"sb", required_argument, 0, 6},
+		{"cp", required_argument, 0, 7},
 		{0, 0, 0, 0}
 	};
 
@@ -91,6 +109,12 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 				return -ERANGE;
 			MSG(0, "Info: inject sb %s\n", pack[opt->sb]);
 			break;
+		case 7:
+			opt->cp = atoi(optarg);
+			if (opt->cp < 0 || opt->cp > 2)
+				return -ERANGE;
+			MSG(0, "Info: inject cp pack %s\n", pack[opt->cp]);
+			break;
 		case 'd':
 			if (optarg[0] == '-' || !is_digits(optarg))
 				return EWRONG_OPT;
@@ -105,6 +129,9 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			if (opt->sb >= 0) {
 				inject_sb_usage();
 				exit(0);
+			} else if (opt->cp >= 0) {
+				inject_cp_usage();
+				exit(0);
 			}
 			return EUNKNOWN_OPT;
 		}
@@ -184,6 +211,101 @@ out:
 	return ret;
 }
 
+static int inject_cp(struct f2fs_sb_info *sbi, struct inject_option *opt)
+{
+	struct f2fs_checkpoint *cp, *cur_cp = F2FS_CKPT(sbi);
+	char *buf = NULL;
+	int ret = 0;
+
+	if (opt->cp == 0)
+		opt->cp = sbi->cur_cp;
+
+	if (opt->cp != sbi->cur_cp) {
+		struct f2fs_super_block *sb = sbi->raw_super;
+		block_t cp_addr;
+
+		buf = calloc(1, F2FS_BLKSIZE);
+		ASSERT(buf != NULL);
+
+		cp_addr = get_sb(cp_blkaddr);
+		if (opt->cp == 2)
+			cp_addr += 1 << get_sb(log_blocks_per_seg);
+		ret = dev_read_block(buf, cp_addr);
+		ASSERT(ret >= 0);
+
+		cp = (struct f2fs_checkpoint *)buf;
+		sbi->ckpt = cp;
+	} else {
+		cp = cur_cp;
+	}
+
+	if (!strcmp(opt->mb, "checkpoint_ver")) {
+		MSG(0, "Info: inject checkpoint_ver of cp %d: 0x%llx -> 0x%lx\n",
+		    opt->cp, get_cp(checkpoint_ver), (u64)opt->val);
+		set_cp(checkpoint_ver, (u64)opt->val);
+	} else if (!strcmp(opt->mb, "ckpt_flags")) {
+		MSG(0, "Info: inject ckpt_flags of cp %d: 0x%x -> 0x%x\n",
+		    opt->cp, get_cp(ckpt_flags), (u32)opt->val);
+		set_cp(ckpt_flags, (u32)opt->val);
+	} else if (!strcmp(opt->mb, "cur_node_segno")) {
+		if (opt->idx >= MAX_ACTIVE_NODE_LOGS) {
+			ERR_MSG("invalid index %u of sb->cur_node_segno[]\n",
+				opt->idx);
+			ret = -EINVAL;
+			goto out;
+		}
+		MSG(0, "Info: inject cur_node_segno[%d] of cp %d: 0x%x -> 0x%x\n",
+		    opt->idx, opt->cp, get_cp(cur_node_segno[opt->idx]),
+		    (u32)opt->val);
+		set_cp(cur_node_segno[opt->idx], (u32)opt->val);
+	} else if (!strcmp(opt->mb, "cur_node_blkoff")) {
+		if (opt->idx >= MAX_ACTIVE_NODE_LOGS) {
+			ERR_MSG("invalid index %u of sb->cur_node_blkoff[]\n",
+				opt->idx);
+			ret = -EINVAL;
+			goto out;
+		}
+		MSG(0, "Info: inject cur_node_blkoff[%d] of cp %d: 0x%x -> 0x%x\n",
+		    opt->idx, opt->cp, get_cp(cur_node_blkoff[opt->idx]),
+		    (u32)opt->val);
+		set_cp(cur_node_blkoff[opt->idx], (u32)opt->val);
+	} else if (!strcmp(opt->mb, "cur_data_segno")) {
+		if (opt->idx >= MAX_ACTIVE_DATA_LOGS) {
+			ERR_MSG("invalid index %u of sb->cur_data_segno[]\n",
+				opt->idx);
+			ret = -EINVAL;
+			goto out;
+		}
+		MSG(0, "Info: inject cur_data_segno[%d] of cp %d: 0x%x -> 0x%x\n",
+		    opt->idx, opt->cp, get_cp(cur_data_segno[opt->idx]),
+		    (u32)opt->val);
+		set_cp(cur_data_segno[opt->idx], (u32)opt->val);
+	} else if (!strcmp(opt->mb, "cur_data_blkoff")) {
+		if (opt->idx >= MAX_ACTIVE_DATA_LOGS) {
+			ERR_MSG("invalid index %u of sb->cur_data_blkoff[]\n",
+				opt->idx);
+			ret = -EINVAL;
+			goto out;
+		}
+		MSG(0, "Info: inject cur_data_blkoff[%d] of cp %d: 0x%x -> 0x%x\n",
+		    opt->idx, opt->cp, get_cp(cur_data_blkoff[opt->idx]),
+		    (u32)opt->val);
+		set_cp(cur_data_blkoff[opt->idx], (u32)opt->val);
+	} else {
+		ERR_MSG("unknown or unsupported member \"%s\"\n", opt->mb);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	print_ckpt_info(sbi);
+	update_checkpoint(sbi, opt->cp);
+
+out:
+	free(buf);
+	sbi->ckpt = cur_cp;
+	return ret;
+}
+
 int do_inject(struct f2fs_sb_info *sbi)
 {
 	struct inject_option *opt = (struct inject_option *)c.private;
@@ -191,6 +313,8 @@ int do_inject(struct f2fs_sb_info *sbi)
 
 	if (opt->sb >= 0)
 		ret = inject_sb(sbi, opt);
+	else if (opt->cp >= 0)
+		ret = inject_cp(sbi, opt);
 
 	return ret;
 }
diff --git a/fsck/inject.h b/fsck/inject.h
index c7d0e33..907309f 100644
--- a/fsck/inject.h
+++ b/fsck/inject.h
@@ -25,6 +25,7 @@ struct inject_option {
 	long long val;		/* new value */
 	char *str;		/* new string */
 	int sb;			/* which sb */
+	int cp;			/* which cp */
 };
 
 void inject_usage(void);
diff --git a/fsck/main.c b/fsck/main.c
index d6a7a47..0318873 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -819,6 +819,7 @@ void f2fs_parse_options(int argc, char *argv[])
 #ifdef WITH_INJECT
 		static struct inject_option inject_opt = {
 			.sb = -1,
+			.cp = -1,
 			.idx = -1,
 		};
 
diff --git a/fsck/mount.c b/fsck/mount.c
index 8524335..ad41215 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -3426,6 +3426,12 @@ void write_checkpoints(struct f2fs_sb_info *sbi)
 	write_checkpoint(sbi);
 }
 
+void update_checkpoint(struct f2fs_sb_info *sbi, int which)
+{
+	sbi->cur_cp = which == 1 ? 2 : 1;
+	write_checkpoint(sbi);
+}
+
 void build_nat_area_bitmap(struct f2fs_sb_info *sbi)
 {
 	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_HOT_DATA);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
