Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C0B91B4A4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Jun 2024 03:32:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sN0Tf-0001VN-Bx;
	Fri, 28 Jun 2024 01:32:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sN0Tb-0001Uh-8S
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Jun 2024 01:32:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=39VvJiZQH1/isjvty8mQlcUebSJMEXB1K9KicFC8mJg=; b=MSlP1DQQYBa2KS6zJnjgK6UTr2
 zRfHaKR/s9ft2GPtknE6kqqUKfk1I0jYVcdfyZmHY29tPDUOrIZenjsaw6ce24jQaSpD+XWYin0E6
 BhQY54+iUHLkZK1RdON4YjctCoX9Qj9Aecm3y6l6Rnz66zVmXsbzcf22zA0op3vj/g4g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=39VvJiZQH1/isjvty8mQlcUebSJMEXB1K9KicFC8mJg=; b=Urz7xay7N9uVK1l+oFnGi6hd+u
 JhN5GfV/g2FPqTwuj8qJ5gSTx8WC7u2uxKFhV6zTKa5tELqr06uuxNkZssG/rAuux/JwiWZGEdAkh
 YT/6xsNzJCbWeDvKLdVoUldhSpir5SIjQ9FiXiwsk9ExC7MumQCMXPrB7HUeoliXZgRY=;
Received: from mail-tyzapc01on2044.outbound.protection.outlook.com
 ([40.107.117.44] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sN0Tb-0006JV-Df for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Jun 2024 01:32:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VS9ZkTatVwSgpVp7XGyX8SUSr1SQM7ofzgeAMkHqnqRfj9FWYm9DU0nEihG/SmefBo7CTcOiVd4Z1ELZHA0veuoXbkCJYy+v4CxaK4DXZlztSFz3Du2RyXTpIsqxMQprJtUs2eS0H1nnRZcqfYVx+4OOmEbvnImPrqlT5dzoT0lCGW8R+2FhqantxIZd9V1hpJ8RnuXJPkjet8Uqps858HuXa2+grzIogI/jR7CWNrdy27xDTLmh190pxL7OgwNVMQk0/8J2q2wNSli4lU/cqiNSI4aC29qBwuAXXsd5wf/6X4/MxTfQkug8oKycEvByYHcDoetvTO/OhPw1pz3Xnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39VvJiZQH1/isjvty8mQlcUebSJMEXB1K9KicFC8mJg=;
 b=AaXr6OMPh7XiCD22iDRP+EI4mUV+T6pz5GsS06TDdqXTdFejo9B0Ywr3rKg8wmqTm/ohKX/S2ESOo5bp++pjWgiSKJM6U19ep9wmgRrRmj/i9EVRQ7temQK6euq2rwDg1BVl7IQ/p+8B863k9siz2vPA5A3cSR9gVw1ZMv3yAP4Y+ts1x4mFAVxVi3YD/DgPKgWGBdiPXIEvgjSNNfFdeUwdum3shgSArRD7UcccRJPx5atTge+97KPNnd6/TcWR9NnUddDbqGbIFtIn6WyKsiP0QnrAkeASzBnyOIkgUyADaP3xcAlmVuYn+5HvWSXLQ5J8+yn43E3XDIqloLV/Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39VvJiZQH1/isjvty8mQlcUebSJMEXB1K9KicFC8mJg=;
 b=q4UbpmIbCIODcamEAdQe6Kr6Ghj2Z+c6pN97nTKVfCvWMkE+KMpRRLmAoDmWGfnX63UrwFS+SVdA+bPSAG6spK8Ij52GPbTLf2JvQw01J7Ms41sSkvUJcA/APCeiTmQnXDOQJNz1Z12/K/N0nLlbfhEYX/eWD/oNlv9JLU3dcRE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TYZPR02MB6576.apcprd02.prod.outlook.com (2603:1096:400:41a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Fri, 28 Jun
 2024 01:32:23 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 01:32:23 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Fri, 28 Jun 2024 09:31:35 +0800
Message-Id: <20240628013140.2444209-6-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240628013140.2444209-1-shengyong@oppo.com>
References: <20240628013140.2444209-1-shengyong@oppo.com>
X-ClientProxiedBy: SI2PR01CA0047.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::10) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TYZPR02MB6576:EE_
X-MS-Office365-Filtering-Correlation-Id: cc9532a7-0cce-4bf9-081d-08dc971228d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?trGfTsm7R5SbLPH+0GIqma1zYIXzksLV18eZl1N/prOFlADvWUEy87Ai8A4s?=
 =?us-ascii?Q?YGK7Omm7Hkk8YUSUEvaN5u74fgiefl7VR5rTjUMQdarUlDUNWl0AhUckWAXq?=
 =?us-ascii?Q?BwO1Yrak+rvBftkfYnS+37zs5lEg2EG1jIvsa+/MuemPX6+X+EjUVqugYbfL?=
 =?us-ascii?Q?TSe1y5rr2RfiA5tXn26+nzz/WCDh5Xjd49wKTpi4UAeu+NGNHvYnJD+akTSd?=
 =?us-ascii?Q?6xNcSLYSX3nVb2oReu3HPzo3Co+HSxz1f6iavp9KpkwV0LQ9oWvpQzcUz5fK?=
 =?us-ascii?Q?gnQTXJn+ySgzu65Xj/JKKeYbvY5K7X2+w42dKjZhnPA/690Yapc7I/TqJ1pt?=
 =?us-ascii?Q?dQr/cpEA8tUXGoK22PheiwnkuvMqiRNnJ35PwU+7Q0vH9V5z6sQE0rMpldsr?=
 =?us-ascii?Q?dQFLHqsx4ICbKreIkC1/xVB/rSDP9pUqU0QY5UpurgmlqVwLLTehFCLzCr6Y?=
 =?us-ascii?Q?azLg3UJ3WxeoCWCE608AA9S/6iKydwQ/bifdsroyzuMjukV/O2nF0xQdWWVY?=
 =?us-ascii?Q?EGL+SAxVrKOiP+FpMI7ECbLP9EOFrEf1KZm4uPi0Ls5udl85ULualRPuJWe+?=
 =?us-ascii?Q?O0wTHzLJQ1/zaab+48pRQt2xJ7yItm/7jl5LD04x6ScDUn57yauCUIxCFxdr?=
 =?us-ascii?Q?ZPHBz4k8tl83xDNCoYcNUoa3GaBSMuoU7ZdoJIZ/Dlex/Q3MwlBDsx18LKyo?=
 =?us-ascii?Q?dzKG+4XQE3dlfqDI3oJ8Y6g1982M3Yj0Wm4INQugqs0tGPdKbqWV5LUmJICF?=
 =?us-ascii?Q?oS/LVtDmatwdGpd/HOP4sKIHhBwiG0NvdFTPgV9s5lsEwwZXlM0vXAucdlTw?=
 =?us-ascii?Q?ln1mFcV/DqjsWSDuYb2aDEbghNUuYLUtagDjq7NK0pB7n4hvnYjskbdj7sBo?=
 =?us-ascii?Q?GAnQJfzG4iA7pH1n8QXUv+1IaAn65kVW5dsM9MWjfSM79Y8SXCbtVfo6SSip?=
 =?us-ascii?Q?qNypSayrUqeUCvyyvYddSRi//r0fXGyy3x7bfKC36uRnuK/1Cml6qWQYItD5?=
 =?us-ascii?Q?vAdfWnOQLSxUYwTK6TkwufFOaApF0jgh5K/qxJzjPaTlpHzDezz3GTXD7jQU?=
 =?us-ascii?Q?IfcM3ON8TlQMzmty85eQaa4dtIvB+lRige9+uWOIWO0nRmktFiC8/70KDo+F?=
 =?us-ascii?Q?HtR83rZ4nXuzue003/fjvbPCwOME4MURA2C0Fms4W9zDyZ+W1rn1yClADl63?=
 =?us-ascii?Q?vRCc/Y17s6JbdRcoCekCOsbeLeab3C1qPWG+avK7tdd8Jo5SOILbNJIX5oZc?=
 =?us-ascii?Q?xeQPzCwM5zPocDqZU0W095X0nwigPEATuj3ONS/7dQD9aJ9J1yES3Igmzkjv?=
 =?us-ascii?Q?JugSL2Kkn6SfiIGtixUSXhqUgWK/WFpr53i/tprhUT0xff3Sv8dhO4fk2N8e?=
 =?us-ascii?Q?CY4W2QBKuY3CA+HWN6gO9ujlIRsL1Y5NH8sd5EuJ2kzQVlw6aA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SV1uuvLR5g4YjOiF9LrNWB6pbIl3ifJEu+hC56s+Ro+U4o3shJWSQbQVRtj2?=
 =?us-ascii?Q?mWGVdIDPLRb44bDEO/FkCT1+UF9ORfZ2d2izg4zF6JzcMjPEyacJjc9RCAUz?=
 =?us-ascii?Q?6fqYdXKFdIQBxLH4y29J2DpgN2HV9IAn7Z9CDU6+64RBdWC6VCfvXSixE1RT?=
 =?us-ascii?Q?XRrjquJMkZejFCH3XaxMj75IRBgTUoTEvwOwm15EFIu3SSmeTHOwBVoo5iTP?=
 =?us-ascii?Q?nzbPavPbll5fpx7q3yxvGPQqxgS4MXiuSL3ut0a91NV2GjVUTWzgupBq7vSr?=
 =?us-ascii?Q?4ccgarTVAuwRGwLHsiGfn1U3iSrED8XTAayb+Qtq7KZKUA68/nVSCKdR9vQL?=
 =?us-ascii?Q?Ay0PCw1V2Vm510OQP2lfBk84CzRd69hmQSAflFbKptXHnDq/ryGXAfdpwCAQ?=
 =?us-ascii?Q?7jy+UY45xE8rKvVggb7hC4OZEywYoS7L22gr1Kv0VQ+q+Y604K0aQSJsJi7f?=
 =?us-ascii?Q?lfrDTcHeBole/405V71Tsy7+A3nvIIopJyZ3DoJT14lxWfZPbjKb4wVV4KSi?=
 =?us-ascii?Q?I3wfLwEhz58000Zmr2A+XlrUuYJ+x+dJG0gqCRrUmkPKGfywKJYkLOwm4nzI?=
 =?us-ascii?Q?lAt6j7JrJlcBYtG3oHSfpAimpjKdX8AP0NcFzcZSuF5L9fH1aMgrHPdmoNal?=
 =?us-ascii?Q?zwCSTxke0WnQwdFB4UPha+02XSOhTrBT2L9ZO2PfIXw2mikJFidHp/4H4hCQ?=
 =?us-ascii?Q?0OcnYCrFf4/VTFkXiF0NMI5VMBCS4ATvb99wNxBsQDhpdwvVhFiCHF+TXy0I?=
 =?us-ascii?Q?0BtCiGb42XzLKtczbJEavb/+JbeMQBmWQFhzPByI789Qiiky4PRulr30fzd7?=
 =?us-ascii?Q?cWeWJxG28q6ATJKBlm0Sray91VtM1IXRUEOZhVyle+wgw0W29RJDwtohggQN?=
 =?us-ascii?Q?jjFBTmyCy5taYLOZvHCNz+SDlUex0uNKfIp7xpG93acmfvFffql6tqHlwKXe?=
 =?us-ascii?Q?nP0SPkAIWd5f1c9ytNu1w82QQvYH+XecqHlpd5Dv6x4mzPTvUeTp1fmCssnI?=
 =?us-ascii?Q?2VCdA1lyEXJ04pqQ7rtighwhRxfznKlxCiHUpCvGSTtSb9sav7q3C5n8t+wL?=
 =?us-ascii?Q?EhEUNGz7R68kqWy4EXcIsinnzpDx3qns1EXlLKva26J9sXLk/chRITPNJSY3?=
 =?us-ascii?Q?LuQUVMu0goSIs8zzG8fAbjVH+PucGUSRakrVmh6EuoeLaL+wQ36nPwNM9Gx6?=
 =?us-ascii?Q?3diacrXdOOWPNT0mqJK1YoJBxOSuVZ2fmw2kThAMxKm8E4JjjAjMnuea191u?=
 =?us-ascii?Q?Cn2AQfI9N+F4WtCjnIYGTj+Trojj8Jql9gdQcGDfnP24rn66u5mHgd8lGhig?=
 =?us-ascii?Q?ztRA947eQzzgUHvdif2wcatgBZ40LovHbbN6bdE4CI15xbof1ExfiXr+xjMu?=
 =?us-ascii?Q?LHMqXfvCAxgAz+8GDiCq7kMv+Jz8b/FBg/gp+HswvdF9BITzf9dl/ol+gY52?=
 =?us-ascii?Q?u6UjlvrdFCOKQcNwQyxd4kst2gLuhPmCRziDcgYZHq/uVSQ7Sog0GjzBVui9?=
 =?us-ascii?Q?w+gwGDN41wjbmK0WPg9Mikno3ms41gOqG6dGsn0nJHjAhhFlWy6U7ZmPQJI4?=
 =?us-ascii?Q?UHQ9Goa+Xgo1qvisdQMP+WT0BlLwLFoe1sDi0en2?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc9532a7-0cce-4bf9-081d-08dc971228d5
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 01:32:23.3909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JN133C9nztYVrOCQPuMKmh+zIysgCUXxVXYaiFeO6e8gvOcDvynIjV2Sjbax4rRkl0fW2RfsTwmQz8WvxxXOfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB6576
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch enables injecting nat entry.
 print_raw_nat_entry_info()
 is added to show values of the nat entry. The meanings of options are: *
 nat: means nat entry is injected, its argument chooses which nat pack to be
 injected, where 0 means the current valid nat is choosen automatically. *
 nid: is the nid of [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.44 listed in wl.mailspike.net]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.44 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.44 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1sN0Tb-0006JV-Df
Subject: [f2fs-dev] [RFC PATCH v2 05/10] inject.f2fs: add nat injection
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

This patch enables injecting nat entry. print_raw_nat_entry_info() is
added to show values of the nat entry.

The meanings of options are:
 * nat: means nat entry is injected, its argument chooses which nat pack
        to be injected, where 0 means the current valid nat is choosen
	automatically.
 * nid: is the nid of the nat entry

The members could be injected in cp contains:
 * version: nat entry version
 * ino: nat entry ino
 * block_addr: nat entry block_addr

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/inject.c | 119 ++++++++++++++++++++++++++++++++++++++++++++++++++
 fsck/inject.h |   2 +
 fsck/main.c   |   2 +
 3 files changed, 123 insertions(+)

diff --git a/fsck/inject.c b/fsck/inject.c
index 6899dbe..c5081f2 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -12,6 +12,16 @@
 #include <getopt.h>
 #include "inject.h"
 
+static void print_raw_nat_entry_info(struct f2fs_nat_entry *ne)
+{
+	if (!c.dbg_lv)
+		return;
+
+	DISP_u8(ne, version);
+	DISP_u32(ne, ino);
+	DISP_u32(ne, block_addr);
+}
+
 void inject_usage(void)
 {
 	MSG(0, "\nUsage: inject.f2fs [options] device\n");
@@ -22,8 +32,10 @@ void inject_usage(void)
 	MSG(0, "  --val <new value> new value to set\n");
 	MSG(0, "  --str <new string> new string to set\n");
 	MSG(0, "  --idx <slot index> which slot is injected in an array\n");
+	MSG(0, "  --nid <nid> which nid is injected\n");
 	MSG(0, "  --sb <0|1|2> --mb <name> [--idx <index>] --val/str <value/string> inject superblock\n");
 	MSG(0, "  --cp <0|1|2> --mb <name> [--idx <index>] --val <value> inject checkpoint\n");
+	MSG(0, "  --nat <0|1|2> --mb <name> --nid <nid> --val <value> inject nat entry\n");
 	MSG(0, "  --dry-run do not really inject\n");
 
 	exit(1);
@@ -59,6 +71,19 @@ static void inject_cp_usage(void)
 	MSG(0, "  cur_data_blkoff: inject cur_data_blkoff array selected by --idx <index>\n");
 }
 
+static void inject_nat_usage(void)
+{
+	MSG(0, "inject.f2fs --nat <0|1|2> --mb <name> --nid <nid> --val <value> inject nat entry\n");
+	MSG(0, "[nat]:\n");
+	MSG(0, "  0: auto select the current nat pack\n");
+	MSG(0, "  1: select the first nat pack\n");
+	MSG(0, "  2: select the second nat pack\n");
+	MSG(0, "[mb]:\n");
+	MSG(0, "  version: inject nat entry version\n");
+	MSG(0, "  ino: inject nat entry ino\n");
+	MSG(0, "  block_addr: inject nat entry block_addr\n");
+}
+
 int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 {
 	int o = 0;
@@ -72,6 +97,8 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 		{"str", required_argument, 0, 5},
 		{"sb", required_argument, 0, 6},
 		{"cp", required_argument, 0, 7},
+		{"nat", required_argument, 0, 8},
+		{"nid", required_argument, 0, 9},
 		{0, 0, 0, 0}
 	};
 
@@ -115,6 +142,18 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 				return -ERANGE;
 			MSG(0, "Info: inject cp pack %s\n", pack[opt->cp]);
 			break;
+		case 8:
+			opt->nat = atoi(optarg);
+			if (opt->nat < 0 || opt->nat > 2)
+				return -ERANGE;
+			MSG(0, "Info: inject nat pack %s\n", pack[opt->nat]);
+			break;
+		case 9:
+			opt->nid = strtol(optarg, NULL, 0);
+			if (opt->nid == ULONG_MAX || opt->nid == LONG_MIN)
+				return -ERANGE;
+			MSG(0, "Info: inject nid %u : 0x%x\n", opt->nid, opt->nid);
+			break;
 		case 'd':
 			if (optarg[0] == '-' || !is_digits(optarg))
 				return EWRONG_OPT;
@@ -132,6 +171,9 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			} else if (opt->cp >= 0) {
 				inject_cp_usage();
 				exit(0);
+			} else if (opt->nat >= 0) {
+				inject_nat_usage();
+				exit(0);
 			}
 			return EUNKNOWN_OPT;
 		}
@@ -307,6 +349,81 @@ out:
 	return ret;
 }
 
+static int inject_nat(struct f2fs_sb_info *sbi, struct inject_option *opt)
+{
+	struct f2fs_nm_info *nm_i = NM_I(sbi);
+	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
+	struct f2fs_nat_block *nat_blk;
+	struct f2fs_nat_entry *ne;
+	block_t blk_addr;
+	unsigned int offs;
+	bool is_set;
+	int ret;
+
+	if (!IS_VALID_NID(sbi, opt->nid)) {
+		ERR_MSG("Invalid nid %u range [%u:%lu]\n", opt->nid, 0,
+			NAT_ENTRY_PER_BLOCK *
+			((get_sb(segment_count_nat) << 1) <<
+			 sbi->log_blocks_per_seg));
+		return -EINVAL;
+	}
+
+	nat_blk = calloc(F2FS_BLKSIZE, 1);
+	ASSERT(nat_blk);
+
+	/* change NAT version bitmap temporarily to select specified pack */
+	is_set = f2fs_test_bit(opt->nid, nm_i->nat_bitmap);
+	if (opt->nat == 0) {
+		opt->nat = is_set ? 2 : 1;
+	} else {
+		if (opt->nat == 1)
+			f2fs_clear_bit(opt->nid, nm_i->nat_bitmap);
+		else
+			f2fs_set_bit(opt->nid, nm_i->nat_bitmap);
+	}
+
+	blk_addr = current_nat_addr(sbi, opt->nid, NULL);
+
+	ret = dev_read_block(nat_blk, blk_addr);
+	ASSERT(ret >= 0);
+
+	offs = opt->nid % NAT_ENTRY_PER_BLOCK;
+	ne = &nat_blk->entries[offs];
+
+	if (!strcmp(opt->mb, "version")) {
+		MSG(0, "Info: inject nat entry version of nid %u "
+		    "in pack %d: %d -> %d\n", opt->nid, opt->nat,
+		    ne->version, (u8)opt->val);
+		ne->version = (u8)opt->val;
+	} else if (!strcmp(opt->mb, "ino")) {
+		MSG(0, "Info: inject nat entry ino of nid %u "
+		    "in pack %d: %d -> %d\n", opt->nid, opt->nat,
+		    le32_to_cpu(ne->ino), (nid_t)opt->val);
+		ne->ino = cpu_to_le32((nid_t)opt->val);
+	} else if (!strcmp(opt->mb, "block_addr")) {
+		MSG(0, "Info: inject nat entry block_addr of nid %u "
+		    "in pack %d: 0x%x -> 0x%x\n", opt->nid, opt->nat,
+		    le32_to_cpu(ne->block_addr), (block_t)opt->val);
+		ne->block_addr = cpu_to_le32((block_t)opt->val);
+	} else {
+		ERR_MSG("unknown or unsupported member \"%s\"\n", opt->mb);
+		free(nat_blk);
+		return -EINVAL;
+	}
+	print_raw_nat_entry_info(ne);
+
+	ret = dev_write_block(nat_blk, blk_addr);
+	ASSERT(ret >= 0);
+	/* restore NAT version bitmap */
+	if (is_set)
+		f2fs_set_bit(opt->nid, nm_i->nat_bitmap);
+	else
+		f2fs_clear_bit(opt->nid, nm_i->nat_bitmap);
+
+	free(nat_blk);
+	return ret;
+}
+
 int do_inject(struct f2fs_sb_info *sbi)
 {
 	struct inject_option *opt = (struct inject_option *)c.private;
@@ -316,6 +433,8 @@ int do_inject(struct f2fs_sb_info *sbi)
 		ret = inject_sb(sbi, opt);
 	else if (opt->cp >= 0)
 		ret = inject_cp(sbi, opt);
+	else if (opt->nat >= 0)
+		ret = inject_nat(sbi, opt);
 
 	return ret;
 }
diff --git a/fsck/inject.h b/fsck/inject.h
index 907309f..db45fb9 100644
--- a/fsck/inject.h
+++ b/fsck/inject.h
@@ -24,8 +24,10 @@ struct inject_option {
 	unsigned int idx;	/* slot index */
 	long long val;		/* new value */
 	char *str;		/* new string */
+	nid_t nid;
 	int sb;			/* which sb */
 	int cp;			/* which cp */
+	int nat;		/* which nat pack */
 };
 
 void inject_usage(void);
diff --git a/fsck/main.c b/fsck/main.c
index 0318873..3ab49a4 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -820,7 +820,9 @@ void f2fs_parse_options(int argc, char *argv[])
 		static struct inject_option inject_opt = {
 			.sb = -1,
 			.cp = -1,
+			.nat = -1,
 			.idx = -1,
+			.nid = -1,
 		};
 
 		err = inject_parse_options(argc, argv, &inject_opt);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
