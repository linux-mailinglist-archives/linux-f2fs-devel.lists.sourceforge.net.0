Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6609E1537
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Dec 2024 09:10:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tINyg-0006oT-LB;
	Tue, 03 Dec 2024 08:09:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1tINye-0006nw-Cb
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Dec 2024 08:09:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N9Ni5AHT7Qj1XSGX6KHCBR9pGyvC7E8sQuUmptqfnyQ=; b=HROb7IMN18a+K33WkujlrmUHF0
 xR9Zi7RMyR4LjPH5R+zxEgfbvazxUYYjALVpm3xDZMNUhdrSCU+38uOYyNMO4o/xIp+xOZUzKeqW/
 Ma4SKC9Tx5eMryi0f2e2Tx6YM81qhcFNUT0uIidE1WEKmwxnJ1yZVn5I99h05a5UKa+A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=N9Ni5AHT7Qj1XSGX6KHCBR9pGyvC7E8sQuUmptqfnyQ=; b=D
 w9t0DZ/VzNiD1sbUIUnYkAmN+3iOUG4TKi43M8ZHJoKqdxaEeV9h91OQQmzHzOXLMbii3we0radBL
 +a2Fln2gyPDZuGfuwYGndsFN5T4lwt6HC5pw9e4JvJzSV1TNYzOpuCr82plwRSHcrwaqX93TN4DAg
 G68DuIA284EEjHME=;
Received: from mail-psaapc01on2080.outbound.protection.outlook.com
 ([40.107.255.80] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tINye-0000fF-52 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Dec 2024 08:09:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iXUAFY4os88a9VFeIb1WRBSCNDq98qt/Ei/hH5jVIP2T5OPMup6wp/8pKM7LftcMqSj/VA1vZURs38qy0UVP8z9HExkVaL2RL9FDG4vqsmzamXfZ9BradeYPP+nFJRaNJBf0RSx3IvtuFVJ7srUHoPpIiLcah9wOVGIesuKHIW0twSbvBWxp96rwH20Nrw8zY0vfVBW2cHki6oaXfKAJFTBvj9vrVIKV1DMmCVJMzsaKd/1P6yJAgZs1reLXk6kuaH9qHnyNWTi9RN1ckvWm5TEvzP32JpAnRasmj+EaBap7XB4CNDhWaU4aMH9wZfalQ71tivGRXxJpt3DsFrYvyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N9Ni5AHT7Qj1XSGX6KHCBR9pGyvC7E8sQuUmptqfnyQ=;
 b=smZOe5sEE/RzchbIHjsAXU+YNDGwqmw+jKS/imcPD2zsDJyz4bN4wTDBNJDVF2wLyxL6jPnc8MOf4BiVUSe0wh0xqY4KSp0QRLxlkhpULMsNPoQRe5i8+Seqd/ctXAUu3mYvYQvweCHD+33VbSil3tfCc/9L+1E9aRAsHO5hvlde0at3J6MZawrQVYP2COrDVXY/swjm7bkhJ/9BynwcO/51LkScl5gm7lGAUZkh42awbGeJyPsEBBZBPfV9bOV+oMei1KijKFHpE1aqJTiRm7Ss4VJ1IOz/McpBDfrfvAT7RLG6Fj0xjd7go8e+St2zAUyjH3bGLvHtSojUWOn/sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9Ni5AHT7Qj1XSGX6KHCBR9pGyvC7E8sQuUmptqfnyQ=;
 b=ZNUiqIjER0yMbZ896mUBLBW88cJU7Jo8KGBYE3FPntYqERQc8/FEMtp8FjnlLhdsBzuTFQTrBp4Wm7enKLyiYY4trE/hmpWhdEWbCbHiYoAm4rNPfgI4jojU4W6iH6+NQY0LzwN4DPUt92YFaKK31mOKZPpdDPbiLJCF93WMxON6u4uuvQy148jjdY6J1dIyFqFyM4IbP7yFYFkXNV+mc/eSQp3nQhdieG8/PD249klvd893EcFDR29TB2oigiRMAiCJdwesXXSrbV1qptALudtesEbNodMaVlVlAGTxL+BS4O6A2CMBJR4kU72Zu6GucQvdgeK/G7+DBXsruqFrXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB7096.apcprd06.prod.outlook.com (2603:1096:405:b5::13)
 by JH0PR06MB7055.apcprd06.prod.outlook.com (2603:1096:990:6e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.9; Tue, 3 Dec
 2024 06:35:39 +0000
Received: from TYZPR06MB7096.apcprd06.prod.outlook.com
 ([fe80::6c3a:9f76:c4a5:c2b]) by TYZPR06MB7096.apcprd06.prod.outlook.com
 ([fe80::6c3a:9f76:c4a5:c2b%6]) with mapi id 15.20.8230.000; Tue, 3 Dec 2024
 06:35:37 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Mon,  2 Dec 2024 23:51:08 -0700
Message-Id: <20241203065108.2763436-1-guochunhai@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To TYZPR06MB7096.apcprd06.prod.outlook.com
 (2603:1096:405:b5::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB7096:EE_|JH0PR06MB7055:EE_
X-MS-Office365-Filtering-Correlation-Id: 02420db3-c2ec-464d-5de7-08dd1364b2a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bQPBU/04mHb1Shs3H6xlWln/F/v3Al2iPFbpBo92K8yB1WZtBEW2wM6ZEeON?=
 =?us-ascii?Q?ndi/dkKbF6CCtTB6RO0pKr60fgTd/2kwqxBT2DlZilnro8rNTK6v7atCYCoD?=
 =?us-ascii?Q?chzZj0YNa/IRtGzctUE63wRdbhz3v9ZlMZiAKma9ZhnfpgBKHxmePc3iJY2s?=
 =?us-ascii?Q?WWIF+MMtcCdw3LiDw1CWjlrcFkWz4XwQA+Si7qT8XUxrsKGg0qRImLyphDmS?=
 =?us-ascii?Q?opMol9Z9j7OBEQYtTZfisUxtnhaZbNxT8cjJnmJ6KB2YbJwKDnhw5eYxoY1v?=
 =?us-ascii?Q?8phMT0JhjbjGCUZ8glg8vfgD4youN6bkdsBlTBQBAQyBm+KjH9OvrbASVvq1?=
 =?us-ascii?Q?IwBqCZcOiHfT/1U2DoFEAKSORdtOvjo5roLIlwh1kDB3z711botN4PSdlFI4?=
 =?us-ascii?Q?rpdYtgCLcuJy30tvI0+0Zoxflv9P7g1CnmkoX3xfKWqI4tOJwDb/IMPl3/rq?=
 =?us-ascii?Q?27ybx0UnnPjRM2TjWkqT98uVA22Ytg4eSHxE5Y4sTyb/F9vs9kZE+aRD4MLP?=
 =?us-ascii?Q?Ev0fDfABWmt4OEhWl7l9yAAferSK5CndCMrxLPdjza/1eumG6smWbEvamlLG?=
 =?us-ascii?Q?e0vgxDzf9EJjLh3BDqjT3CoDzBfLvYyfD4FdJ24JgMjvgj2eHbjrl+c4oQcJ?=
 =?us-ascii?Q?GmoquA9Xv/YRuUXYFj3Im5NWTDliyWVuash7JJYqxrZzjEr4EsyOuCf3xCni?=
 =?us-ascii?Q?QYPIR/uiv9Dvf1yTzIhi04n6voyYSbRETeFUxnG74++U8d+GpbW0kxdAUyg+?=
 =?us-ascii?Q?yoq6xNGffvev7nidSIgqXXwUsrb/IKKcHeemjECxuUCeZ/3KSTXqby1q87KE?=
 =?us-ascii?Q?SFl2BdG8/tkbDV5FPMlfuwyHECSVXYiTDfKd+5YGKvfVS1uC3hwWcNgZsrU/?=
 =?us-ascii?Q?KRDij0hA5eHVqy2ITilYnSIaTL62XilWz+3/jVHg8idDN00PUQ+VWdKRWDvY?=
 =?us-ascii?Q?EIrVQZBnsR/DreeQZmPt1M+qT+j1iPxLcdLVdpS6EL0ndAXyszBlJSOR+XdV?=
 =?us-ascii?Q?TsBgClhX7ujT0I9VwNjyPjCw1PrezHjIcS3WIcIohmr6kXkZPvJXbPShPpy0?=
 =?us-ascii?Q?PS6HKJY/FjFxsiu8iwEVq2vKuvWNPlrHgl2FG21LA0BANya5UamZaP8ZFL6Q?=
 =?us-ascii?Q?ocAxqbPvOI06koNLz2QH38Nv3FreiISsJa0W7tWstbgo8gPm9e397KhjgMhX?=
 =?us-ascii?Q?kJsc6lUhqOLuyrY6gYEvHRlWxBVaXkcU4zNq6QOmGxYX8vLpowgwWxvHNE5H?=
 =?us-ascii?Q?o4zJDltdfF2ef/EbjCY20W5VOWqFULluMkZIDK1gtZggyze+kX7XaDlWfjLI?=
 =?us-ascii?Q?t3LItiUYqocmb/R/rJLqGD3gNv24SNy9fgCkIQVsVEo12ulZ0Pm9ek2fakwm?=
 =?us-ascii?Q?0Nf7gge1n1F9owH9JpbP+M0YzYDe4cObFWb/tAeuGeFzD1nVRg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB7096.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VAem7W1f+5Ku9xiBEQV8gMRnnLw16SOHyNghKz8BZaRF01BLjQ3pow9bkRpL?=
 =?us-ascii?Q?hwih8gp8CnZIoEWcU17Ew/aIE1MxxU2+lbJ6Z/JoGrF2cNxThyiB/0pxG/v8?=
 =?us-ascii?Q?g49cRkQ8vxUWqO8SUlGFqJYf0PItrOxY3sIHqsWQmpN0CtLebd8yE3Ic1T8/?=
 =?us-ascii?Q?/WqO5cvw0NxRJK6c2Y3N1Mgli1BVLMGnk6p3PNueeODCRh/ihEAtym/beJC8?=
 =?us-ascii?Q?SG2Zmcp4Tw9LFVAfpdt1ommmwBTSr66w7hbKVJSM96+kpzn5HlSEaouDeWnx?=
 =?us-ascii?Q?JQvNqmRkLwHAnmuCvJa+Ywi3/1/gDAvI+AjWAf7g5wQ0C9wOdWh+gHRtyGg1?=
 =?us-ascii?Q?noxdts6lGu31J9+SFYLllqJU/T+rjzQpJNt3hkc6iAET/HNgiATIsFvpBn6t?=
 =?us-ascii?Q?J8VAcPx0MNvKJw/UL6L8+XapmZYlv5qJg4lxPA34pOmZsLiL6duRrSdye2ss?=
 =?us-ascii?Q?2HM+oU4hyOguMvZ0/5neLqAvsQEf7SJVM8sib0I1FPwwovf1x4Uik46tA8uR?=
 =?us-ascii?Q?Sa/qmQ5mnFO2St7cdVi3wkHRO06c8jSJRMcy1Ebx5IlIKU750EDxzbFEzadZ?=
 =?us-ascii?Q?tcG/jzwgV5zFXVUWDzp9y9JdW0IJCamYTsGcglfJ+y3EKn1cNZWQnxrTSfOS?=
 =?us-ascii?Q?wzTP4rjHGhLDPT44pbCnxbTHzHGB8Pk+bUO9gCCfNm8iQcrDAMmC1OnjlzLb?=
 =?us-ascii?Q?0lIVF44JJZsc2KOqjYZMTgzRx5+EmsiS8Y9ciqth4oIWo3Mx9uWoMr4vxVmK?=
 =?us-ascii?Q?CFYxZ3MuYHcg91eWChsNARkJee3JyCicoSptAbiBbZLfIkVGVcHg4Y+96BPn?=
 =?us-ascii?Q?yN65/a6QAUqxE5cHIhbCBl+7Sc8cQyIutdNj00rS1WpxTuzuZH4yVEJt7vlX?=
 =?us-ascii?Q?jmfxhiI29IzIBEa2lHRhQ8yJh8YJBnSUTiIs4sjP3RpKy0fGYvrY7Vb9wXoq?=
 =?us-ascii?Q?Gd/pSka2D5ReM5lAn85TV98GkG6q/djcJ6BwfU3plu9dC/U3TUlhcuEKHG8K?=
 =?us-ascii?Q?RW/f+KfaKJyji32zaxKeTncx43FV1LX4V/wxTfjLolVo68Vr8+VGKs0FAoP9?=
 =?us-ascii?Q?CAgU59dmm87ZHOBWadJwHsX8wn0M7NmVLQBw0hILHdVEWOFKCMUjKKPezBaa?=
 =?us-ascii?Q?hbH+XJ5cmegSCczLnLxOB8yB8khmR9WEdWkN349e1sowk3tT2Es57kn4Dg75?=
 =?us-ascii?Q?kWaZ5IDlGJjtk5vQOnqOaete7dxgQS93eU1gbfaj5ZZKgI3lCrQ0S6gvQCKI?=
 =?us-ascii?Q?KcTkDfVYCDu3jisGUvsvfRgvJgPLzpNtL2CIvhCwieyLujPnUM3whig9YqBy?=
 =?us-ascii?Q?Ax9Nfqi0SHeu9N0N0IiY61PJsAviGh/msYS7cqkDD0qq99huRwzRE6gCcsX4?=
 =?us-ascii?Q?ZAKZIEt64HRtQQtKdseqe6jzHxglgF+qbUKk9G0R92f/V6tVaqJ26A6xvM3f?=
 =?us-ascii?Q?l0iTMknbBIQOEuykRBe8fEN3fQ9I+gPVTPEnvuIvGA3DFDwuywXcdedxfsni?=
 =?us-ascii?Q?QrHtbsG/paB97rosThv5DKFP48cNcmsWgpSL0VrzYqVBS1xSBzY1S/lnMV1h?=
 =?us-ascii?Q?i8xEwVlrowL5iHhakUtKGzPTIfahocUpXiVHfGH6?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02420db3-c2ec-464d-5de7-08dd1364b2a0
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB7096.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 06:35:37.2566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W63zNyrLftVd0zMtG/vKiCaBd9jO6ogb2zb+OD/5mQpuTK2f2O0IqcDVjixkaGTQUiIciVNzXSv6q+xfhzQ+4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7055
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: locate_dirty_segment() does not set any current active
 segment
 as a prefree segment. Thus, the issue described below may occur: Step 1:
 During a checkpoint, add_discard_addrs() does not handle the current active
 'segment X' with 0 valid blocks (and non-zero discard blocks). As a result,
 no struct discard_cmd is created for 'se [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.255.80 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.255.80 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.80 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.80 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tINye-0000fF-52
Subject: [f2fs-dev] [PATCH] f2fs: fix missing discard for active segments
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
From: Chunhai Guo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chunhai Guo <guochunhai@vivo.com>
Cc: Chunhai Guo <guochunhai@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

locate_dirty_segment() does not set any current active segment as a
prefree segment. Thus, the issue described below may occur:

Step 1: During a checkpoint, add_discard_addrs() does not handle the
current active 'segment X' with 0 valid blocks (and non-zero discard
blocks). As a result, no struct discard_cmd is created for 'segment X'
and the value of sbi->discard_blks cannot be reduced to 0 after the
checkpoint.

Step 2: f2fs is umounted without setting CP_TRIMMED_FLAG, as
sbi->discard_blks is non-zero.

Since add_discard_addrs() can handle active segments with non-zero valid
blocks, it is reasonable to fix this issue by also handling active
segments with 0 valid blocks in add_discard_addrs().

Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
---
 fs/f2fs/segment.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index eade36c5ef13..4fb1dc4aab97 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2090,7 +2090,9 @@ static bool add_discard_addrs(struct f2fs_sb_info *sbi, struct cp_control *cpc,
 		return false;
 
 	if (!force) {
-		if (!f2fs_realtime_discard_enable(sbi) || !se->valid_blocks ||
+		if (!f2fs_realtime_discard_enable(sbi) ||
+			(!se->valid_blocks &&
+				!IS_CURSEG(sbi, cpc->trim_start)) ||
 			SM_I(sbi)->dcc_info->nr_discards >=
 				SM_I(sbi)->dcc_info->max_discards)
 			return false;
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
