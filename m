Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D7E926DB2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Jul 2024 04:58:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sPCg0-00070T-CR;
	Thu, 04 Jul 2024 02:58:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sPCfz-00070H-Nd
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 02:58:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9JfHNXlW7FxB70zshkv6GRcNJPJIrNGl4CMKq1AiHa8=; b=iIFX6fqgYTmrRmAsPU5qvrFvqv
 YPSzFDTCLZT5EWMYljWjU00QqZbbkwluLo1ateMwZQnH297Rhf6ux+OpUMZWz7xJZG9oaNs/tRURf
 HILllt8DdqOKBSu6muHQH8rQR8Lb/PHCbS+gSSsvgasnKyG3tMJa09rKE9WXik7ntup4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9JfHNXlW7FxB70zshkv6GRcNJPJIrNGl4CMKq1AiHa8=; b=R5LMZULJMvDQNXmJkK2tS2Ol3D
 wPgSSDNzTjI5fdaYHmWsbANb9TwMkQLjImAew5cW9f94xT6b4hIuJqduPUktEOd+P5+s01VPCwJkO
 iEYKBt5qXc4Z9RsTzIRyd8VeG8OEHWqIh0A7zP/v0gyrP+cPxu9XBhrlI/Cx6/OhoT0M=;
Received: from mail-sgaapc01on2042.outbound.protection.outlook.com
 ([40.107.215.42] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sPCfz-00010i-Om for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 02:58:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXsiQ8R1YbCxIbzDf6sdnvmHzo+KikQh2HV0HgyJ/aBMuSieOSybkJWXRQHciwmotHKE10xY+vGiqE3cj3k2ur9e9HvnuonuUmma6seAaY2n0r4MXHxenMMdwnNsHxZUPuqRUpxW01dN4BrHU47yNNsoCj8OBacawfnLBkNxA6xvJL7kiPit6xvQagL1ON0B5a64EPeOjfABsu/JwaWTF90fPQcB59g+nrmPTY+Y5DyTI2FQ1ou+4qEMtut2fbkY9wIoNv3SIXkM1k81tcgUjNZ389JH2gNsTwsWuzQENZJiJBEThXMr3xq5oPpHlo6+8GKAAX1Wf313hi+LMF1Yzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9JfHNXlW7FxB70zshkv6GRcNJPJIrNGl4CMKq1AiHa8=;
 b=VQ5hmVbEJcNFqzKddRwSmptYzTKM/YeOibIQA/JWm8HJ3NOo5G2gnisjYsXTBh41Yu8TNWqWtCXy0iWZQB1BkVCW7Kuex9Jz/cwaw8NJDNHukc9ffz3eyko3LnNR0QkU6HIo7Tqpcz+GQe0gk5gYLW/oQy/M6EklJXIP5aMWsO7wz1Oco6Yh4ZwOJwkziajx1K5QqBOcQMNlp/3CyMmxj60vMNmog+go2wpBkWUUDVYeR/MrEi+aSDhttI9p1eNrSaKNUQDAM3do+AbQsWJS38t77dYFZEIZPco30tIi1b8yIozRBmn9ppEVn52KTkQeHQlG2aZBfjM3Yl1VMx6Ngg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9JfHNXlW7FxB70zshkv6GRcNJPJIrNGl4CMKq1AiHa8=;
 b=Mu/wOLKQKdVCuF/eyIyrvnMonNA8QEF3skyLaMYvaSnQrcA71DnEuTzAVHymn2xXbB+AWB2m61vl2W7/RbWje3qNSJRMeuuUR5JoTqiilSnkqrfQuMMSePQDDv7IY7PUOqpSasjmLUtVHTTiokhXqq/JFxUY6Xd7yzWdxVdWB98=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SEYPR02MB7733.apcprd02.prod.outlook.com (2603:1096:101:20c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Thu, 4 Jul
 2024 02:58:14 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7719.029; Thu, 4 Jul 2024
 02:58:14 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Thu,  4 Jul 2024 10:57:36 +0800
Message-Id: <20240704025740.527171-7-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240704025740.527171-1-shengyong@oppo.com>
References: <20240704025740.527171-1-shengyong@oppo.com>
X-ClientProxiedBy: TYAPR01CA0220.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::16) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SEYPR02MB7733:EE_
X-MS-Office365-Filtering-Correlation-Id: 958bfcbc-69fe-4131-5fec-08dc9bd52525
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XmyAB56SknGQymJc/hqJMIlwMSGuggcfrgOk7v9SwYTWyGEHNHIAGFiv/esQ?=
 =?us-ascii?Q?9wKjye45UnG1JW8m19ig+cR0u+POTenzw01H8N297iy+Q6tBnrHhNY6smuIk?=
 =?us-ascii?Q?KOltmgcs5fmfR/+ztbWVqa0vg+uG74iaRwcyzqPdlpftD6oJLFbiAAl3oZvF?=
 =?us-ascii?Q?VCzc8jslGWeTRkPLRYvHw1FBDPihTHA/HVA4KKF/oKOvRP3JOM+gbdm1zGBb?=
 =?us-ascii?Q?WvAJQcahMd7NuiGFrAEjFAJ7k/sQqHgX7Xk+2YI/n+I6kjGg3QoZyljFyGx0?=
 =?us-ascii?Q?VNhLllYlm4nX8xuAWhUireb6feknvQLzSSElKGP+Fjpk4qYyoB5rhmyZCWjP?=
 =?us-ascii?Q?BODQzn3Ggc3My2ZKgUw0C4pzQxdm5nQs/1X7ym0y0MQ1kJf9BFn6rsatRPK0?=
 =?us-ascii?Q?PM+emQqJWfIhV6SVSmmw7VzHgX3kBaVxibNaS6GDJ3bycq/6mnmmk+ICberX?=
 =?us-ascii?Q?k0pmvLr9d3cc8yZPv6AB+X6CPxaLrXaX7jujsTjY0X/fzjCe1jgCB3wp7C13?=
 =?us-ascii?Q?2TMNBRofgK7fG6BKdMN2OMXwLiRYRK+W9K0wjyl5M8mhgyLpYbAGws2q32No?=
 =?us-ascii?Q?jqKAxoDmJxPpni6uC/Sp/PkvKceQCDy42lQOzPhX9++en0thrWD5xcQWDocc?=
 =?us-ascii?Q?PAQRyd/SVBAfCvh05lMSpkSyrRpHNznBHjWm7N8Ot0Ao/rXxMCSmDF+LeaIp?=
 =?us-ascii?Q?O2KJEhcV3t4ihfN+Ebm1WYlEBkNpkpOq88u0CLUA0yjnCnERXSQrfGoOONkL?=
 =?us-ascii?Q?AuJi+qqNVaDbdZXlKff2LfYJ9veyIs1F5V22aRjltcXej6juLqvTnPN7zker?=
 =?us-ascii?Q?wH67tS2Fo+ipau6Dd0ElddHkEbMGf8C5O6JnU2Y38VVhqeE5RD8Se99FSXwQ?=
 =?us-ascii?Q?7lDPByU0XurOlMoitDMCHJJpnSkDDxLDaEQWEZROSX5OErrACyzcXoD4JNLg?=
 =?us-ascii?Q?bgt2ie1muwNq0F01mSBGzg7NcmH7JqGV+KGShZlBdCmL7OTQ67Eqx/wYI8GU?=
 =?us-ascii?Q?tTu2XuUvh8YEF1jq1OMD1RRBi73BlcD+2a9p6HMPsalROmPAwjrzs5r0Ldch?=
 =?us-ascii?Q?6chi4ZmXxJxiz8BArGTPcxKPjOAHirA6IMTC8gF1+416mMCC8TPFYHihkq5V?=
 =?us-ascii?Q?RdKv4/Fys6Ly64iDIiDAaQP429lorBs4dPTecUnINHfL2tvgUt9WqQgmD6RF?=
 =?us-ascii?Q?sgE63KukMe9zY7Ia7KGhr+xuCLbZ6qRUvIvsdyOOOXe48ZC6toKus9EHrhC7?=
 =?us-ascii?Q?2c0oyHCkGJQ2KcKBxDbVcaOs4gMjPsSCc5d33Ns3knTQXW19WgWiJ7FKnQWJ?=
 =?us-ascii?Q?dneO14wh5JX5NKMiZMwgMtW2bmWtIgWs0o19uQV5UHMLxCzfvIpiRtBHGU4n?=
 =?us-ascii?Q?eUqlQ0Zyl+mZZFtam6A/KgepHza2PwzhMqmK8av28t3tbxNq/g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TDDZ9IppZj9ubc/Z3q5tz4/tRK5hWE+v2RaErRZ5OkR4EH/jF100nb5sypDe?=
 =?us-ascii?Q?Wzef9iEYBO5R4ZWrWt9XRWcwCFJIDYqkUbj7YAL7QufsS5Fs3Hc4KpZ41gCF?=
 =?us-ascii?Q?C5NgkArdTv+fluADLb5U2EcOpEYU4O4jzodhrVBr/4rqPPjonN1dd930KmI4?=
 =?us-ascii?Q?6bUNL9Vip52rRtj+yJ2I/51ENexg5ObxQoT7LC+TmrILVnarMtRDmPNaGrvQ?=
 =?us-ascii?Q?ZRWmgMkezFJlrHyoCqIbumeQmu54wVX4m6r+HHUT0aytNctPhNa5uU85PApj?=
 =?us-ascii?Q?7TBrDw6mOuWWtRYxtJB2XrKEtTIDChmmJeUeWoj5ZmbHUi5UWv4I1xfdaw+5?=
 =?us-ascii?Q?Z6SuTRERIBNlKmxpRudA0tXJGeZ3kyy/0bdQ7FBTAnoE2K8BeEVPRHCMzpwV?=
 =?us-ascii?Q?0pzsCzXFfH1H6yU5pjJOykoc+a8gIeynAf+iImADxgOGEdUTTCQZ9ZYk2n/9?=
 =?us-ascii?Q?UIXaWrugGCuL4wx9BlHE0ovX1ggnrC92pdDkfSKiqza1prsLLsIpif02l5Jp?=
 =?us-ascii?Q?g/UkaFsZFEuTJptRZPagzYw04vibACTX0FlojnNzuYQNl5m1HTbvBd9PF5M1?=
 =?us-ascii?Q?QXycuO8LvkQ0bFJx4AGawZ5Hjn/CG/NG+B+sGO4dpE0qd2dw1o06fgBNUdhb?=
 =?us-ascii?Q?vfw792J+vm+FDb1SQ80qg5DfM0ijhlt71a94dWKX4Jv7I4fECfCmlR1/zUzA?=
 =?us-ascii?Q?+9Hli68QyNtz4Kux8jfa6ave42D0xSGSHOH4IcDjzVKSqD+x+7YXlBc5yV2i?=
 =?us-ascii?Q?EY6Ii8qV8TyO4IxQ1cbb/WpOCE5gxr5C7fIoKms+cedjQEjoSyrFH9EXacV6?=
 =?us-ascii?Q?TcJpv48/Up13YsubibfpoNe8RBdQZBmHDvZ3ampIr2Tiv06psjRFEm9W5QWi?=
 =?us-ascii?Q?c0GzG3AgSli2EVjBVYvTPvaOW722SSNylzWrDm7Q7IwiOPb02KeOBZWJYtQt?=
 =?us-ascii?Q?ePDSQKkjwOKHCCjyjnEyETqQjLkXlGvGCtBjLwoA3XrfrZjryOJq0Eifn/dU?=
 =?us-ascii?Q?dHtc0jU3g46eIVuUAkAgBrMYDJknkBtwvuzkMM6OlI/26Eb1P6ApRPtykTBJ?=
 =?us-ascii?Q?SKcbu/9kjdoWgnpLcmysOtSUIkSglgyzZSpQ45E8tcdWiBGZDBPF6TtUYC1w?=
 =?us-ascii?Q?dEjSNkyMEbbGXXDGyeOY3bLQHG167Ymz8UxG+YsKUSp8Hs0/M1K2X95X1YNJ?=
 =?us-ascii?Q?RLjwbHwSUGQ97cASQWwR8d151M/rQlO5eJaNp3lLaLVI5V68vqWNCkdqtPc2?=
 =?us-ascii?Q?8n1Df1N2eoYd37NJPPeyQV+Yfnt9Pv5laQPUgMKPS63DNki3VV1v41tuyvD/?=
 =?us-ascii?Q?9b38NF9EDn7jiaDNgBUY/2bAq6H/ygyIyeLRr6rBKw7bjgtyriHOSuqmGXjb?=
 =?us-ascii?Q?nB5MHEE2SAgIaVq0EtUWhCCUydJU/aGtcXxe+kWYdr0iVlu4/R392uc7sgHN?=
 =?us-ascii?Q?eDYOewZtzlmSsxS7rkrgROSqOhI9KamWTZwGWRSRgwrL/4nKcDS5jjsrIyj3?=
 =?us-ascii?Q?LvGZ/4FOlgNGSRp3dBL2hvicf88cA57jkI6AinOSPx9f01PFx2LM1oqD3cbd?=
 =?us-ascii?Q?MDO/W0knydQ1Ak+rDqY1DV4D8bFtTWkXPkP1uNmZ?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 958bfcbc-69fe-4131-5fec-08dc9bd52525
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 02:58:14.1413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ILi0U4Kz/I2PkH3lRnj2SCmIH0D2IhJ/1gEcOf+ARyilkgNV4bq8K20nF3bHuQB3vZfNPeYiUepGxuZwWivCGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR02MB7733
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch enables injecting sit entry.
 print_raw_sit_entry_info()
 is added to show values of the sit entry. The meanings of options are: *
 sit: means sit entry is injected, its argument chooses which sit pack to be
 injected, where 0 means the current valid sit is choosen automatically. *
 blk: is the block a [...] 
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
 [40.107.215.42 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [40.107.215.42 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.42 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.42 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1sPCfz-00010i-Om
Subject: [f2fs-dev] [RCF PATCH v3 06/10] inject.f2fs: add sit injection
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

This patch enables injecting sit entry. print_raw_sit_entry_info() is
added to show values of the sit entry.

The meanings of options are:
 * sit: means sit entry is injected, its argument chooses which sit pack
        to be injected, where 0 means the current valid sit is choosen
	automatically.
 * blk: is the block address of the sit entry.

The members could be injected in cp contains:
 * vblocks: sit entry vblocks
 * valid_map: sit entry valid_map
 * mtime: sit entry mtime

Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/inject.c | 133 ++++++++++++++++++++++++++++++++++++++++++++++++++
 fsck/inject.h |   2 +
 fsck/main.c   |   1 +
 3 files changed, 136 insertions(+)

diff --git a/fsck/inject.c b/fsck/inject.c
index b6f5c59..5799353 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -22,6 +22,27 @@ static void print_raw_nat_entry_info(struct f2fs_nat_entry *ne)
 	DISP_u32(ne, block_addr);
 }
 
+static void print_raw_sit_entry_info(struct f2fs_sit_entry *se)
+{
+	int i;
+
+	if (!c.dbg_lv)
+		return;
+
+	DISP_u16(se, vblocks);
+	if (c.layout)
+		printf("%-30s ", "valid_map:");
+	else
+		printf("%-30s\t\t[", "valid_map");
+	for (i = 0; i < SIT_VBLOCK_MAP_SIZE; i++)
+		printf("%02x", se->valid_map[i]);
+	if (c.layout)
+		printf("\n");
+	else
+		printf("]\n");
+	DISP_u64(se, mtime);
+}
+
 void inject_usage(void)
 {
 	MSG(0, "\nUsage: inject.f2fs [options] device\n");
@@ -33,9 +54,11 @@ void inject_usage(void)
 	MSG(0, "  --str <new string> new string to set\n");
 	MSG(0, "  --idx <slot index> which slot is injected in an array\n");
 	MSG(0, "  --nid <nid> which nid is injected\n");
+	MSG(0, "  --blk <blkaddr> which blkaddr is injected\n");
 	MSG(0, "  --sb <0|1|2> --mb <name> [--idx <index>] --val/str <value/string> inject superblock\n");
 	MSG(0, "  --cp <0|1|2> --mb <name> [--idx <index>] --val <value> inject checkpoint\n");
 	MSG(0, "  --nat <0|1|2> --mb <name> --nid <nid> --val <value> inject nat entry\n");
+	MSG(0, "  --sit <0|1|2> --mb <name> --blk <blk> [--idx <index>] --val <value> inject sit entry\n");
 	MSG(0, "  --dry-run do not really inject\n");
 
 	exit(1);
@@ -84,6 +107,19 @@ static void inject_nat_usage(void)
 	MSG(0, "  block_addr: inject nat entry block_addr\n");
 }
 
+static void inject_sit_usage(void)
+{
+	MSG(0, "inject.f2fs --sit <0|1|2> --mb <name> --blk <blk> [--idx <index>] --val <value> inject sit entry\n");
+	MSG(0, "[sit]:\n");
+	MSG(0, "  0: auto select the current sit pack\n");
+	MSG(0, "  1: select the first sit pack\n");
+	MSG(0, "  2: select the second sit pack\n");
+	MSG(0, "[mb]:\n");
+	MSG(0, "  vblocks: inject sit entry vblocks\n");
+	MSG(0, "  valid_map: inject sit entry valid_map\n");
+	MSG(0, "  mtime: inject sit entry mtime\n");
+}
+
 int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 {
 	int o = 0;
@@ -100,6 +136,8 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 		{"cp", required_argument, 0, 7},
 		{"nat", required_argument, 0, 8},
 		{"nid", required_argument, 0, 9},
+		{"sit", required_argument, 0, 10},
+		{"blk", required_argument, 0, 11},
 		{0, 0, 0, 0}
 	};
 
@@ -165,6 +203,21 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 				return -ERANGE;
 			MSG(0, "Info: inject nid %u : 0x%x\n", opt->nid, opt->nid);
 			break;
+		case 10:
+			if (!is_digits(optarg))
+				return EWRONG_OPT;
+			opt->sit = atoi(optarg);
+			if (opt->sit < 0 || opt->sit > 2)
+				return -ERANGE;
+			MSG(0, "Info: inject sit pack %s\n", pack[opt->sit]);
+			break;
+		case 11:
+			opt->blk = strtol(optarg, &endptr, 0);
+			if (opt->blk == LONG_MAX || opt->blk == LONG_MIN ||
+			    *endptr != '\0')
+				return -ERANGE;
+			MSG(0, "Info: inject blkaddr %u : 0x%x\n", opt->blk, opt->blk);
+			break;
 		case 'd':
 			if (optarg[0] == '-' || !is_digits(optarg))
 				return EWRONG_OPT;
@@ -185,6 +238,9 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			} else if (opt->nat >= 0) {
 				inject_nat_usage();
 				exit(0);
+			} else if (opt->sit >= 0) {
+				inject_sit_usage();
+				exit(0);
 			}
 			return EUNKNOWN_OPT;
 		}
@@ -435,6 +491,81 @@ static int inject_nat(struct f2fs_sb_info *sbi, struct inject_option *opt)
 	return ret;
 }
 
+static int inject_sit(struct f2fs_sb_info *sbi, struct inject_option *opt)
+{
+	struct sit_info *sit_i = SIT_I(sbi);
+	struct f2fs_sit_block *sit_blk;
+	struct f2fs_sit_entry *sit;
+	unsigned int segno, offs;
+	bool is_set;
+
+	if (!f2fs_is_valid_blkaddr(sbi, opt->blk, DATA_GENERIC)) {
+		ERR_MSG("Invalid blkaddr 0x%x (valid range [0x%x:0x%lx])\n",
+			opt->blk, SM_I(sbi)->main_blkaddr,
+			(unsigned long)le64_to_cpu(F2FS_RAW_SUPER(sbi)->block_count));
+		return -EINVAL;
+	}
+
+	sit_blk = calloc(F2FS_BLKSIZE, 1);
+	ASSERT(sit_blk);
+
+	segno = GET_SEGNO(sbi, opt->blk);
+	/* change SIT version bitmap temporarily to select specified pack */
+	is_set = f2fs_test_bit(segno, sit_i->sit_bitmap);
+	if (opt->sit == 0) {
+		opt->sit = is_set ? 2 : 1;
+	} else {
+		if (opt->sit == 1)
+			f2fs_clear_bit(segno, sit_i->sit_bitmap);
+		else
+			f2fs_set_bit(segno, sit_i->sit_bitmap);
+	}
+	get_current_sit_page(sbi, segno, sit_blk);
+	offs = SIT_ENTRY_OFFSET(sit_i, segno);
+	sit = &sit_blk->entries[offs];
+
+	if (!strcmp(opt->mb, "vblocks")) {
+		MSG(0, "Info: inject sit entry vblocks of block 0x%x "
+		    "in pack %d: %u -> %u\n", opt->blk, opt->sit,
+		    le16_to_cpu(sit->vblocks), (u16)opt->val);
+		sit->vblocks = cpu_to_le16((u16)opt->val);
+	} else if (!strcmp(opt->mb, "valid_map")) {
+		if (opt->idx == -1) {
+			MSG(0, "Info: auto idx = %u\n", offs);
+			opt->idx = offs;
+		}
+		if (opt->idx >= SIT_VBLOCK_MAP_SIZE) {
+			ERR_MSG("invalid idx %u of valid_map[]\n", opt->idx);
+			free(sit_blk);
+			return -ERANGE;
+		}
+		MSG(0, "Info: inject sit entry valid_map[%d] of block 0x%x "
+		    "in pack %d: 0x%02x -> 0x%02x\n", opt->idx, opt->blk,
+		    opt->sit, sit->valid_map[opt->idx], (u8)opt->val);
+		sit->valid_map[opt->idx] = (u8)opt->val;
+	} else if (!strcmp(opt->mb, "mtime")) {
+		MSG(0, "Info: inject sit entry mtime of block 0x%x "
+		    "in pack %d: %lu -> %lu\n", opt->blk, opt->sit,
+		    le64_to_cpu(sit->mtime), (u64)opt->val);
+		sit->mtime = cpu_to_le64((u64)opt->val);
+	} else {
+		ERR_MSG("unknown or unsupported member \"%s\"\n", opt->mb);
+		free(sit_blk);
+		return -EINVAL;
+	}
+	print_raw_sit_entry_info(sit);
+
+	rewrite_current_sit_page(sbi, segno, sit_blk);
+	/* restore SIT version bitmap */
+	if (is_set)
+		f2fs_set_bit(segno, sit_i->sit_bitmap);
+	else
+		f2fs_clear_bit(segno, sit_i->sit_bitmap);
+
+	free(sit_blk);
+	return 0;
+}
+
 int do_inject(struct f2fs_sb_info *sbi)
 {
 	struct inject_option *opt = (struct inject_option *)c.private;
@@ -446,6 +577,8 @@ int do_inject(struct f2fs_sb_info *sbi)
 		ret = inject_cp(sbi, opt);
 	else if (opt->nat >= 0)
 		ret = inject_nat(sbi, opt);
+	else if (opt->sit >= 0)
+		ret = inject_sit(sbi, opt);
 
 	return ret;
 }
diff --git a/fsck/inject.h b/fsck/inject.h
index db45fb9..ece4915 100644
--- a/fsck/inject.h
+++ b/fsck/inject.h
@@ -25,9 +25,11 @@ struct inject_option {
 	long long val;		/* new value */
 	char *str;		/* new string */
 	nid_t nid;
+	block_t blk;
 	int sb;			/* which sb */
 	int cp;			/* which cp */
 	int nat;		/* which nat pack */
+	int sit;		/* which sit pack */
 };
 
 void inject_usage(void);
diff --git a/fsck/main.c b/fsck/main.c
index 8527199..bfdb5ba 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -826,6 +826,7 @@ void f2fs_parse_options(int argc, char *argv[])
 			.sb = -1,
 			.cp = -1,
 			.nat = -1,
+			.sit = -1,
 			.idx = -1,
 			.nid = -1,
 		};
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
