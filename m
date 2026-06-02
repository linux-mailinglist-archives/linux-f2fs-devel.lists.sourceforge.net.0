Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3g8CE2LmHmqYYwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 02 Jun 2026 16:19:14 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E46162F3D9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 02 Jun 2026 16:19:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="i3h/k2xU";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=OEwJi0eh;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=D+9fPHMY;
	dkim=fail ("body hash did not verify") header.d=vivo.com header.s=selector2 header.b=no6nHZmg;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HnuzbtxkXue1EgjgNEnVPDgCM2a6iVfYWBMPqdG9ylU=; b=i3h/k2xU/aPKvFxOWuiExWpKJM
	qwbR6tnFjfx4PXSnil5EPH1tkGckQIHJBj7dC+Mzx52PGJjOwvntQwxUGFzqzqDdq7VUouxSrVnLB
	JbdUx4KnS7MovCe4LSIhJ/eGMxrNPeG6Zuwn2tDKXah6AaFCnJfblooG2QEFyGYbwks0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wUPxI-0005Iz-Gn;
	Tue, 02 Jun 2026 14:18:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liaoyuanhong@vivo.com>) id 1wUPxG-0005Ih-RB
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jun 2026 14:18:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UaYA916ZJ96ybeoIPMCMzMGmDK1PEz5P0GkHJvTfqZ4=; b=OEwJi0ehKuMCOQD7VtjthS84We
 Gb8ntxKLGuJ8vPQNRc2qnKQYnbp+UCMUso1uQ5XuRRgpaCiIY88N0Lm8wL+COIPry9pbqUBfrWrAq
 qk1dX9qXa2z1bWt6hfqH4K49TFNfBI+etuuJRkl/7XTZ2hdyKx947vAyROCttLBwtzXo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UaYA916ZJ96ybeoIPMCMzMGmDK1PEz5P0GkHJvTfqZ4=; b=D+9fPHMYIOjWMDUN27n1w2Dz6K
 /vFNWQz7Y+yPTQAIZqe72P1p1NWN/P9Ny+C7gwL9G2+YbNb8yDFq8z6s6sEWiqcUIU2FDJi2dpzpC
 cnsEUf3MKqzeYuDIsxMahlOr9gXRcHX0NPHKk89g5QRdkwK5ccLZa933o/BHltHOPgFw=;
Received: from mail-japaneastazon11012025.outbound.protection.outlook.com
 ([52.101.126.25] helo=TYPPR03CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wUPxD-0006iq-0K for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jun 2026 14:18:55 +0000
Received: from TYZPR06MB5950.apcprd06.prod.outlook.com (2603:1096:400:333::12)
 by SI2PR06MB5316.apcprd06.prod.outlook.com (2603:1096:4:1eb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 2 Jun 2026
 14:18:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EUdB8QUIlo0EbV9Z8Pj2yuvmNJUrG7A9PIT3vJgEtVTe4a+tOxeNDB87ouDyMvhv/LKWbkjRU+npDuKOXTNPECTnlq+rtaS7HtgHvFHL21JuDnRQQXbTuBlyCxiT4thPoyJM2uYrMcEyj/eMvvmHE2xA30KM1Ontjlh/N2TaIwTIPtT8TdOq6DRSt1lEySNp9QE/dNMNzTktxi4deWvz0VUuQqxD3US/JHUKCaSkZzTp0BMM6naTE5YuaHsdbk+wqHt5OMU9DjGWlii8eSuYqlfL6kB5QR8OVk0iM3sPnXxNbk7AoNqonk0ZCH6OE2KsMLAH+CqMJKq6MS4udDczeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UaYA916ZJ96ybeoIPMCMzMGmDK1PEz5P0GkHJvTfqZ4=;
 b=n8uSWhwiM5yZxUTHczaad6UJelcS5xcxk25WJv4ohO/aURmwog1C2Z5VEFhvjIW6JW7AAopxSzBWbfBkwu2R8QFHr9iFGuSJAO7NPtZx4rDS5gawi/C2rgfxITWBqe/xucihXmJSx7M8rrWjNp+xO6dlKSbiWRTnKtHP/l+SWfZUSu6nYRE0nAJWkcsHrmKBpjXtCpZNNWKIHynQXxe2L8+UuLTktdUFZu7Mu1A4WDQlCnx12D+cYA7VxRfSNGb7puhrMZqahlMLBrB+KMMyz2H/XDcDk099O6wGLTWG49+7jyI+0eA4v5lbqkj5hCh2etojzEusecBufL9KLV610g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UaYA916ZJ96ybeoIPMCMzMGmDK1PEz5P0GkHJvTfqZ4=;
 b=no6nHZmgaPnDMLNHY86kdsRDHSqIGF4grWTwrPTapeU/y1sj3ntEaHlR6HlMAKb8sdXsT6YhHDsyxwKEb/bj0+4HJZiPfMWOSfdt6q2c8dWtCGE3NuoyBZZ05HkexfG34yTNuejGHLTa8aARHLlhgOVunUBJlYcwB1esEXQ1goQX/xYHJLtFN4ecBj+aW4IN/0ea/YepV8MiAiLGCeOenrsWKK9x0bKzD1U232PSbRxSiQ1OVcvuTxknaS4GjHKxHL5DLf0np0C6yYEkOlJoZ2tcpOEx+ihOCbVPA2PbnOJxRpUv3lJkaEk8BUou6kDnqSjs8mbG+o2L+3eaqOhZvA==
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by TYZPR06MB5950.apcprd06.prod.outlook.com (2603:1096:400:333::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 2 Jun 2026
 13:41:26 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::24bc:5613:3ffa:cb96]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::24bc:5613:3ffa:cb96%6]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 13:41:26 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net (open list:F2FS FILE SYSTEM),
 linux-kernel@vger.kernel.org (open list)
Date: Tue,  2 Jun 2026 21:41:01 +0800
Message-Id: <20260602134104.348655-3-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260602134104.348655-1-liaoyuanhong@vivo.com>
References: <20260602134104.348655-1-liaoyuanhong@vivo.com>
X-ClientProxiedBy: TP0P295CA0038.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::11) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|TYZPR06MB5950:EE_|SI2PR06MB5316:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e52fe00-bcb9-418f-53b4-08dec0aca4e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|366016|56012099006|11063799006|18002099003|22082099003|3023799007|38350700014;
X-Microsoft-Antispam-Message-Info: Gi5SJ3fMySpwjQMZsC7KQJKBVSZXye9OjEjdHK9HrUHrCaqIvomGxe3cDoyQc60jFC0K10EF729+Kh2s+zUSOp6ckfzeVj8sufbhykvJx/Vomrfmhg/AloS5Td0eCUjybtzuK06kvwfhcT6/Jp0Z3eHs9yATScSYdnTG8V/5M49IEkuGFCMDxw8FrrP2q5bAaSb/oCD4qSmEKhgPCRLTHL05PZcDuzW6jPQuALlbCnvYxWaixExcyjy47Zj2eIM/PiG71mLw3kaj7lH735RTyxYEwhnUU7t/nl8uN8/OEfRwNHSUFrYYOddd9Tya6hbRIcOQAItoP3CCDWj/IDu5BXgD9b10bGZUyO+Fkb0hLLLf+ZzbYc9i1Ijez06e2CKBPQTVykq5W9+xN+GGrV7ave5cZZ2od7jRea33bX0/WnCOPNBCOToin1D6PCHLleo2SsnLJ/iGV6dl/sT8k7b59vMqENoSswGuLRs3+boxiXlLYNSA6X6aTBQK8RQgFYi55+yryQcZCTXHqMaqg5xNLR5XKGwZZ0ob329m4Bcjd2ixilaon0k1ZbGSNlngkwxoP4mVI8OkH62NPdXmAu+BF/NNgTKlER8ig2jr5hPkT4S1xw3mqLybexdfxKtSb+mIAyamyfeYvQjGLhoWC8B4hB9qa68S8Pks69UNvFxlEoBi7K2WN+Egwc1WrU/uo3F1/k46XBvGWV2GeEfXOF7SnjEMxEVVfAFp58f84WhSg0DnNuWU77AhjkWNI0ZJk4Ow
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(366016)(56012099006)(11063799006)(18002099003)(22082099003)(3023799007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9DvEf6/srdl7K2DsuPExZYm/7yF1w4CNmVmXhWYcLmcdE9g3GxTWQRd+ZX5p?=
 =?us-ascii?Q?HQycplDm6piwaz34NcKGLlv1/D3E6ntTiyzCxC+qX7QoVx/lG3rOZlE/9XKF?=
 =?us-ascii?Q?HtHM97ooOy6pji71vhOzhvbpMJOx8U4ykiR7Cy8oNyuCdh21TZVkHz0o7H0j?=
 =?us-ascii?Q?r2WMS++bPnitYP29vCAZyTX1OBHk9x8+Iy6t3ad42cburMtPiKikQsAWLtjB?=
 =?us-ascii?Q?Qy7anVhWhmJm0l1Tm87QRDecXdPbUeDh5L3uXEfJ76GnQzTB+jmeWRpyFUoI?=
 =?us-ascii?Q?dZ9Q0TfTg6V9eiI23KI3iufRLITBAIFRB13qONtV1Togy6Fm7Ha+rDbCWCsz?=
 =?us-ascii?Q?w3UCzTcvV3NH414QS6dKhEtGR+VROotcs6OYEWkGI1Jo0n81l+Jqlt3XqUfN?=
 =?us-ascii?Q?+s8SIdzhK7XWzIqlEAMH6YHQNob60YjG2QAwXKqIOCoYlA0Cr+hAFhKbdKXF?=
 =?us-ascii?Q?yGrAZj2YeZKx6sFJxk7jtGsJ+ZUXXBB4U3xv+Lchkecr9ErRnazM8uKAsZa9?=
 =?us-ascii?Q?Yfq7HPpJ2BxwIR0tHo42FjfoQIe+BJYhpkgNuXJqhsa4BcNiSou7L0b8l/uP?=
 =?us-ascii?Q?l6BcNjFxU8C6+hO17Epzv0LY6LJkwrl7byzI5WgSTriesQ0OG4Rt5yYFoQZi?=
 =?us-ascii?Q?LBoy6JdEQ0HitusiAQwKyBEBxvyJI5S2ZdZU5JGMOYBpL2aOB13C0IqRaSN7?=
 =?us-ascii?Q?xNo/4gmXG9X6ATzxIGx6Ow0MbHgHJEWWvlTUSAy1GkvMCSwCMW8gg3oFA1qA?=
 =?us-ascii?Q?dnvVbNOTbhwjOX2Ez2lC0w/HBrvItqu63J4gPdm3HMWH0uXX/XAhQyiH1xe4?=
 =?us-ascii?Q?V3acfPdjmjykIbTdnHyP9r3g8n2EBs5Z6XTANQoQ9cQ9HJ7elyfsshA3fyNm?=
 =?us-ascii?Q?ipxLEJJVjZEkTyZ4+opOInNWwEKNfG4pRqvrsomjkJqGLfweLqOfWFUNTh9X?=
 =?us-ascii?Q?rUn96ppptgtPWXvpaybeTESsXOTB7Bg6OQrvFJsDsORDh71PltW6+XnBuHnM?=
 =?us-ascii?Q?aUrIUL1Gy7cEqhYd60zIUl+K94KzKW6jJDr2FIFMOl7czzPVAaPST2SjKLll?=
 =?us-ascii?Q?a4V1KHrrqUsXyL30QhZ66AsXq4EqXFg9vZQzGznG04WZQADqwC010o7HzPjj?=
 =?us-ascii?Q?4jgqtX2BMrsuxB76uJEZmTm42b9aZVOKaSksRG7tvaGAnjc8QGT8eXfyao5W?=
 =?us-ascii?Q?mHSlCW2NoUtzPzZTamL71jHcfiREmo7H8wJZHXiKtdKrvDVUWxCsuW0qqydz?=
 =?us-ascii?Q?fAyIsmOv8ihkeU+dCe/OC9xeW5z356yTiO8D0GNbsMnCsyO3Am3VC/+4z1gL?=
 =?us-ascii?Q?6vtYOQGZlenuk9hC4b2Lq/H07kAlnz7m6r2ZIWzkB43LdEdbkSctJgQQ06mj?=
 =?us-ascii?Q?wvpskO313YugsIt/L8G+fc6BTIuYFI1oYqnBPhJqZUDPhuXQJzqfzhQujQJf?=
 =?us-ascii?Q?WL103Hpt6uzXDEbC0sHdb/APNE0j1lBn20GR4Gma7HXb+sL+DCBnGmjPr5eH?=
 =?us-ascii?Q?UudXJEwFzXGE6uQ1kBS5KMI6NVbpJYLAwkA7oWL8kBuR4xVhYn3s24GCqJm3?=
 =?us-ascii?Q?eTFK6gsE1ywpnfyFFzc0i2bQSS4nhNNLUjHX1+4gt+5rFLXNrpmFFiBtN1u6?=
 =?us-ascii?Q?JOZ1gKVsTnCb8+VzN3ATtifGEnx707xgnDlI0UNtdmP6VZLnaiHlPRIQPsQI?=
 =?us-ascii?Q?W5kAuxIkNdD9TInRQj/+JjNGEYq5HaxntFneRVHnI5qXeByO/wtt5iXu+Jw4?=
 =?us-ascii?Q?2xtDLWRV6Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e52fe00-bcb9-418f-53b4-08dec0aca4e5
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 13:41:26.8511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U+RH0r332tzfMQNJrMIc9tKNLwg6HdPimlA4CBr7zzXSid53y+JDNIM8speOrwUsxG+eUPjkk2HuwbalBedbXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5950
X-OriginatorOrg: vivo.com
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: F2FS normally disables inline data for encrypted regular
 files
 because the inline payload is stored in the inode block and does not pass
 through the regular fscrypt data I/O path. This wastes space fo [...] 
 Content analysis details:   (1.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 1.0 HK_RANDOM_FROM         From username looks random
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.126.25 listed in wl.mailspike.net]
X-Headers-End: 1wUPxD-0006iq-0K
Subject: [f2fs-dev] [PATCH v2 2/3] f2fs: support encrypted inline data
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
From: LiaoYuanhong-vivo via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: LiaoYuanhong-vivo <liaoyuanhong@vivo.com>
Cc: LiaoYuanhong-vivo <liaoyuanhong@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-kernel@vger.kernel.org,m:liaoyuanhong@vivo.com,s:lists@lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,vivo.com:s=selector2];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,vivo.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vivo.com:mid,vivo.com:email,vivo.com:replyto];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[liaoyuanhong@vivo.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E46162F3D9

F2FS normally disables inline data for encrypted regular files because the
inline payload is stored in the inode block and does not pass through the
regular fscrypt data I/O path.  This wastes space for small encrypted files
on filesystems that otherwise use inline_data.

Add encrypted inline data support for encrypted regular files.  When the
encrypted_inline_data on-disk feature is enabled, inline payloads of
encrypted regular files are stored as ciphertext in the inode block.  They
are decrypted into page-cache plaintext on read and encrypted before being
copied back into the inode block on write.

F2FS keeps the on-disk format decision separate from fscrypt key
capability.  It uses fscrypt_supports_data_unit_inplace() when deciding
whether a new file may keep inline_data.  It calls
fscrypt_prepare_data_unit_inplace() only when the encrypted inline payload
is actually read or written.

Update inline-data size checks to use the encrypted inline capacity, since
the stored payload is rounded to the fscrypt contents alignment.  If an
encrypted inline-data file is truncated from a non-zero offset, convert it
to normal data blocks first and then use the normal truncate path.
Recovery copies inline payloads as on-disk bytes.

Signed-off-by: LiaoYuanhong-vivo <liaoyuanhong@vivo.com>
---
Changes in v2:
- Use fscrypt capability checking in f2fs_may_inline_data(); prepare
  software crypto only in encrypted inline read/write paths.
- Use the encrypted inline-data capacity across F2FS size checks.
- Convert encrypted inline data before non-zero truncation and propagate
  inline read/decrypt errors.

 fs/f2fs/Kconfig  |  14 +++++
 fs/f2fs/data.c   |   8 +--
 fs/f2fs/f2fs.h   |  37 ++++++++++++-
 fs/f2fs/file.c   |  24 ++++++++-
 fs/f2fs/inline.c | 131 ++++++++++++++++++++++++++++++++++++++++++-----
 fs/f2fs/super.c  |  12 +++++
 fs/f2fs/sysfs.c  |   8 +++
 7 files changed, 214 insertions(+), 20 deletions(-)

diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
index 5916a02fb46d..0220f23be56d 100644
--- a/fs/f2fs/Kconfig
+++ b/fs/f2fs/Kconfig
@@ -92,6 +92,20 @@ config F2FS_FAULT_INJECTION
 
 	  If unsure, say N.
 
+config F2FS_FS_ENCRYPTED_INLINE_DATA
+	bool "F2FS encrypted inline data support"
+	depends on F2FS_FS && FS_ENCRYPTION
+	help
+	  Allow encrypted regular files to keep inline data inside the inode
+	  while encrypting that inode-managed payload in software.
+
+	  This does not change normal data block encryption.  Normal data
+	  blocks continue to use the existing fscrypt path, such as blk-crypto
+	  when inline encryption is enabled.
+
+	  Filesystems carrying the encrypted_inline_data incompat feature
+	  require this option in order to be mounted correctly.
+
 config F2FS_FS_COMPRESSION
 	bool "F2FS compression feature"
 	depends on F2FS_FS
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 657fd5986c73..9371ffa7c96d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3700,7 +3700,7 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 
 	/* f2fs_lock_op avoids race between write CP and convert_inline_page */
 	if (f2fs_has_inline_data(inode)) {
-		if (pos + len > MAX_INLINE_DATA(inode))
+		if (pos + len > f2fs_max_inline_data(inode))
 			flag = F2FS_GET_BLOCK_DEFAULT;
 		f2fs_map_lock(sbi, &lc, flag);
 		locked = true;
@@ -3720,8 +3720,10 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 	set_new_dnode(&dn, inode, ifolio, ifolio, 0);
 
 	if (f2fs_has_inline_data(inode)) {
-		if (pos + len <= MAX_INLINE_DATA(inode)) {
-			f2fs_do_read_inline_data(folio, ifolio);
+		if (pos + len <= f2fs_max_inline_data(inode)) {
+			err = f2fs_do_read_inline_data(folio, ifolio);
+			if (err)
+				goto out;
 			set_inode_flag(inode, FI_DATA_EXIST);
 			if (inode->i_nlink)
 				folio_set_f2fs_inline(ifolio);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 832b2f8beb11..0a2d75baf23e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -276,6 +276,7 @@ struct f2fs_mount_info {
 #define F2FS_FEATURE_RO				0x00004000
 #define F2FS_FEATURE_DEVICE_ALIAS		0x00008000
 #define F2FS_FEATURE_PACKED_SSA			0x00010000
+#define F2FS_FEATURE_ENCRYPTED_INLINE_DATA	0x00020000
 
 #define __F2FS_HAS_FEATURE(raw_super, mask)				\
 	((raw_super->feature & cpu_to_le32(mask)) != 0)
@@ -4502,7 +4503,7 @@ extern struct kmem_cache *f2fs_inode_entry_slab;
 bool f2fs_may_inline_data(struct inode *inode);
 bool f2fs_sanity_check_inline_data(struct inode *inode, struct folio *ifolio);
 bool f2fs_may_inline_dentry(struct inode *inode);
-void f2fs_do_read_inline_data(struct folio *folio, struct folio *ifolio);
+int f2fs_do_read_inline_data(struct folio *folio, struct folio *ifolio);
 void f2fs_truncate_inline_inode(struct inode *inode, struct folio *ifolio,
 		u64 from);
 int f2fs_read_inline_data(struct inode *inode, struct folio *folio);
@@ -4595,6 +4596,39 @@ static inline bool f2fs_encrypted_file(struct inode *inode)
 	return IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode);
 }
 
+static inline bool f2fs_sb_has_encrypted_inline_data(struct f2fs_sb_info *sbi);
+
+static inline bool f2fs_uses_encrypted_inline_data(struct inode *inode)
+{
+#ifdef CONFIG_F2FS_FS_ENCRYPTED_INLINE_DATA
+	/*
+	 * When the filesystem allows encrypted inline data, inline payloads
+	 * in encrypted regular files are interpreted as ciphertext.
+	 */
+	return f2fs_sb_has_encrypted_inline_data(F2FS_I_SB(inode)) &&
+	       f2fs_encrypted_file(inode);
+#else
+	return false;
+#endif
+}
+
+static inline unsigned int f2fs_max_inline_data(struct inode *inode)
+{
+	unsigned int max_bytes = MAX_INLINE_DATA(inode);
+
+	/*
+	 * Encrypted inline data is rounded up to the fscrypt contents
+	 * alignment before being stored back into the inode.  This is an
+	 * on-disk layout constraint, so it must not depend on whether the
+	 * inode's key has been prepared yet.
+	 */
+#ifdef CONFIG_F2FS_FS_ENCRYPTED_INLINE_DATA
+	if (f2fs_uses_encrypted_inline_data(inode))
+		max_bytes = round_down(max_bytes, FSCRYPT_CONTENTS_ALIGNMENT);
+#endif
+	return max_bytes;
+}
+
 static inline void f2fs_set_encrypted_inode(struct inode *inode)
 {
 #ifdef CONFIG_FS_ENCRYPTION
@@ -4827,6 +4861,7 @@ F2FS_FEATURE_FUNCS(compression, COMPRESSION);
 F2FS_FEATURE_FUNCS(readonly, RO);
 F2FS_FEATURE_FUNCS(device_alias, DEVICE_ALIAS);
 F2FS_FEATURE_FUNCS(packed_ssa, PACKED_SSA);
+F2FS_FEATURE_FUNCS(encrypted_inline_data, ENCRYPTED_INLINE_DATA);
 
 #ifdef CONFIG_BLK_DEV_ZONED
 static inline bool f2fs_zone_is_seq(struct f2fs_sb_info *sbi, int devi,
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 71385ca4163d..ec243bb9039b 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -825,12 +825,32 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
 	}
 
 	if (f2fs_has_inline_data(inode)) {
+		if (f2fs_uses_encrypted_inline_data(inode) && from) {
+			f2fs_folio_put(ifolio, true);
+			if (lock)
+				f2fs_unlock_op(sbi, &lc);
+
+			err = f2fs_convert_inline_inode(inode);
+
+			if (lock)
+				f2fs_lock_op(sbi, &lc);
+			if (err)
+				goto out;
+
+			ifolio = f2fs_get_inode_folio(sbi, inode->i_ino);
+			if (IS_ERR(ifolio)) {
+				err = PTR_ERR(ifolio);
+				goto out;
+			}
+			goto truncate_blocks;
+		}
 		f2fs_truncate_inline_inode(inode, ifolio, from);
 		f2fs_folio_put(ifolio, true);
 		truncate_page = true;
 		goto out;
 	}
 
+truncate_blocks:
 	set_new_dnode(&dn, inode, ifolio, NULL, 0);
 	err = f2fs_get_dnode_of_data(&dn, free_from, LOOKUP_NODE_RA);
 	if (err) {
@@ -1147,7 +1167,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 	if (attr->ia_valid & ATTR_SIZE) {
 		loff_t old_size = i_size_read(inode);
 
-		if (attr->ia_size > MAX_INLINE_DATA(inode)) {
+		if (attr->ia_size > f2fs_max_inline_data(inode)) {
 			/*
 			 * should convert inline inode before i_size_write to
 			 * keep smaller than inline_data size with inline flag.
@@ -5007,7 +5027,7 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
 
 	if (f2fs_has_inline_data(inode)) {
 		/* If the data will fit inline, don't bother. */
-		if (pos + count <= MAX_INLINE_DATA(inode))
+		if (pos + count <= f2fs_max_inline_data(inode))
 			return 0;
 		ret = f2fs_convert_inline_inode(inode);
 		if (ret)
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 099f72089701..37d6509ea01a 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -21,7 +21,7 @@ static bool support_inline_data(struct inode *inode)
 		return false;
 	if (!S_ISREG(inode->i_mode) && !S_ISLNK(inode->i_mode))
 		return false;
-	if (i_size_read(inode) > MAX_INLINE_DATA(inode))
+	if (i_size_read(inode) > f2fs_max_inline_data(inode))
 		return false;
 	return true;
 }
@@ -31,6 +31,9 @@ bool f2fs_may_inline_data(struct inode *inode)
 	if (!support_inline_data(inode))
 		return false;
 
+	if (f2fs_uses_encrypted_inline_data(inode))
+		return fscrypt_supports_data_unit_inplace(inode);
+
 	return !f2fs_post_read_required(inode);
 }
 
@@ -65,7 +68,9 @@ bool f2fs_sanity_check_inline_data(struct inode *inode, struct folio *ifolio)
 	 * been synchronized to inmem fields.
 	 */
 	return (S_ISREG(inode->i_mode) &&
-		(file_is_encrypt(inode) || file_is_verity(inode) ||
+		((file_is_encrypt(inode) &&
+		  !f2fs_sb_has_encrypted_inline_data(F2FS_I_SB(inode))) ||
+		 file_is_verity(inode) ||
 		(F2FS_I(inode)->i_flags & F2FS_COMPR_FL)));
 }
 
@@ -80,22 +85,66 @@ bool f2fs_may_inline_dentry(struct inode *inode)
 	return true;
 }
 
-void f2fs_do_read_inline_data(struct folio *folio, struct folio *ifolio)
+int f2fs_do_read_inline_data(struct folio *folio, struct folio *ifolio)
 {
 	struct inode *inode = folio->mapping->host;
+	unsigned int len = min_t(loff_t, i_size_read(inode),
+				 f2fs_max_inline_data(inode));
 
 	if (folio_test_uptodate(folio))
-		return;
+		return 0;
 
 	f2fs_bug_on(F2FS_I_SB(inode), folio->index);
 
-	folio_zero_segment(folio, MAX_INLINE_DATA(inode), folio_size(folio));
+	if (f2fs_uses_encrypted_inline_data(inode)) {
+		struct page *tmp_page;
+		void *kaddr;
+		int err;
+
+		folio_zero_segment(folio, 0, folio_size(folio));
 
-	/* Copy the whole inline data block */
-	memcpy_to_folio(folio, 0, inline_data_addr(inode, ifolio),
-		       MAX_INLINE_DATA(inode));
+		/*
+		 * Decrypt through a temporary page because inline data occupies
+		 * only a byte range inside the inode folio.
+		 */
+		tmp_page = alloc_page(GFP_NOFS | __GFP_ZERO);
+		if (!tmp_page)
+			return -ENOMEM;
+
+		len = round_up(len, FSCRYPT_CONTENTS_ALIGNMENT);
+		if (len) {
+			err = fscrypt_prepare_data_unit_inplace(inode);
+			if (err) {
+				__free_page(tmp_page);
+				return err;
+			}
+			memcpy_to_page(tmp_page, 0, inline_data_addr(inode, ifolio),
+				       len);
+			err = fscrypt_crypt_data_unit_inplace(inode, tmp_page,
+							      len, 0, 0,
+							      false);
+			if (err) {
+				__free_page(tmp_page);
+				return err;
+			}
+		}
+
+		kaddr = kmap_local_page(tmp_page);
+		memcpy_to_folio(folio, 0, kaddr,
+				min_t(loff_t, i_size_read(inode),
+				      f2fs_max_inline_data(inode)));
+		kunmap_local(kaddr);
+		__free_page(tmp_page);
+	} else {
+		folio_zero_segment(folio, MAX_INLINE_DATA(inode),
+				   folio_size(folio));
+		/* Copy the whole inline data block */
+		memcpy_to_folio(folio, 0, inline_data_addr(inode, ifolio),
+				MAX_INLINE_DATA(inode));
+	}
 	if (!folio_test_uptodate(folio))
 		folio_mark_uptodate(folio);
+	return 0;
 }
 
 void f2fs_truncate_inline_inode(struct inode *inode, struct folio *ifolio,
@@ -119,6 +168,7 @@ void f2fs_truncate_inline_inode(struct inode *inode, struct folio *ifolio,
 int f2fs_read_inline_data(struct inode *inode, struct folio *folio)
 {
 	struct folio *ifolio;
+	int ret = 0;
 
 	ifolio = f2fs_get_inode_folio(F2FS_I_SB(inode), inode->i_ino);
 	if (IS_ERR(ifolio)) {
@@ -134,7 +184,13 @@ int f2fs_read_inline_data(struct inode *inode, struct folio *folio)
 	if (folio->index)
 		folio_zero_segment(folio, 0, folio_size(folio));
 	else
-		f2fs_do_read_inline_data(folio, ifolio);
+		ret = f2fs_do_read_inline_data(folio, ifolio);
+
+	if (!folio->index && ret) {
+		f2fs_folio_put(ifolio, true);
+		folio_unlock(folio);
+		return ret;
+	}
 
 	if (!folio_test_uptodate(folio))
 		folio_mark_uptodate(folio);
@@ -186,7 +242,9 @@ int f2fs_convert_inline_folio(struct dnode_of_data *dn, struct folio *folio)
 
 	f2fs_bug_on(F2FS_F_SB(folio), folio_test_writeback(folio));
 
-	f2fs_do_read_inline_data(folio, dn->inode_folio);
+	err = f2fs_do_read_inline_data(folio, dn->inode_folio);
+	if (err)
+		return err;
 	folio_mark_dirty(folio);
 
 	/* clear dirty state */
@@ -267,6 +325,8 @@ int f2fs_write_inline_data(struct inode *inode, struct folio *folio)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct folio *ifolio;
+	void *inline_addr;
+	int err = 0;
 
 	ifolio = f2fs_get_inode_folio(sbi, inode->i_ino);
 	if (IS_ERR(ifolio))
@@ -280,8 +340,50 @@ int f2fs_write_inline_data(struct inode *inode, struct folio *folio)
 	f2fs_bug_on(F2FS_I_SB(inode), folio->index);
 
 	f2fs_folio_wait_writeback(ifolio, NODE, true, true);
-	memcpy_from_folio(inline_data_addr(inode, ifolio),
-			 folio, 0, MAX_INLINE_DATA(inode));
+	inline_addr = inline_data_addr(inode, ifolio);
+
+	if (f2fs_uses_encrypted_inline_data(inode)) {
+		struct page *tmp_page;
+		void *kaddr;
+		unsigned int len = min_t(loff_t, i_size_read(inode),
+					 f2fs_max_inline_data(inode));
+
+		tmp_page = alloc_page(GFP_NOFS | __GFP_ZERO);
+		if (!tmp_page) {
+			err = -ENOMEM;
+			goto out;
+		}
+
+		len = round_up(len, FSCRYPT_CONTENTS_ALIGNMENT);
+		if (len) {
+			err = fscrypt_prepare_data_unit_inplace(inode);
+			if (err) {
+				__free_page(tmp_page);
+				goto out;
+			}
+			kaddr = kmap_local_page(tmp_page);
+			memcpy_from_folio(kaddr, folio, 0,
+					  min_t(loff_t, i_size_read(inode),
+						f2fs_max_inline_data(inode)));
+			kunmap_local(kaddr);
+			err = fscrypt_crypt_data_unit_inplace(inode, tmp_page,
+							      len, 0, 0,
+							      true);
+		}
+		if (!err) {
+			memset(inline_addr, 0, MAX_INLINE_DATA(inode));
+			if (len) {
+				kaddr = kmap_local_page(tmp_page);
+				memcpy(inline_addr, kaddr, len);
+				kunmap_local(kaddr);
+			}
+		}
+		__free_page(tmp_page);
+		if (err)
+			goto out;
+	} else {
+		memcpy_from_folio(inline_addr, folio, 0, MAX_INLINE_DATA(inode));
+	}
 	folio_mark_dirty(ifolio);
 
 	f2fs_clear_page_cache_dirty_tag(folio);
@@ -290,8 +392,9 @@ int f2fs_write_inline_data(struct inode *inode, struct folio *folio)
 	set_inode_flag(inode, FI_DATA_EXIST);
 
 	folio_clear_f2fs_inline(ifolio);
+out:
 	f2fs_folio_put(ifolio, true);
-	return 0;
+	return err;
 }
 
 int f2fs_recover_inline_data(struct inode *inode, struct folio *nfolio)
@@ -826,7 +929,7 @@ int f2fs_inline_data_fiemap(struct inode *inode,
 			return PTR_ERR(ifolio);
 		f2fs_folio_wait_writeback(ifolio, NODE, true, true);
 	}
-	ilen = min_t(size_t, MAX_INLINE_DATA(inode), i_size_read(inode));
+	ilen = min_t(size_t, f2fs_max_inline_data(inode), i_size_read(inode));
 	if (start >= ilen)
 		goto out;
 	if (start + len < ilen)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index c6afdbd6e1cd..9eddcde7939c 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1549,6 +1549,18 @@ static int f2fs_check_opt_consistency(struct fs_context *fc,
 		return -EINVAL;
 	}
 
+	if (f2fs_sb_has_encrypted_inline_data(sbi)) {
+		if (!IS_ENABLED(CONFIG_F2FS_FS_ENCRYPTED_INLINE_DATA)) {
+			f2fs_err(sbi,
+				 "encrypted_inline_data requires CONFIG_F2FS_FS_ENCRYPTED_INLINE_DATA");
+			return -EINVAL;
+		}
+		if (!f2fs_sb_has_encrypt(sbi)) {
+			f2fs_err(sbi, "encrypted inline_data requires encryption feature");
+			return -EINVAL;
+		}
+	}
+
 	/*
 	 * The BLKZONED feature indicates that the drive was formatted with
 	 * zone alignment optimization. This is optional for host-aware
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 665687244c93..600eaee75926 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1399,6 +1399,9 @@ F2FS_FEATURE_RO_ATTR(pin_file);
 F2FS_FEATURE_RO_ATTR(linear_lookup);
 #endif
 F2FS_FEATURE_RO_ATTR(packed_ssa);
+#ifdef CONFIG_F2FS_FS_ENCRYPTED_INLINE_DATA
+F2FS_FEATURE_RO_ATTR(encrypted_inline_data);
+#endif
 F2FS_FEATURE_RO_ATTR(fserror);
 
 #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
@@ -1567,6 +1570,9 @@ static struct attribute *f2fs_feat_attrs[] = {
 	BASE_ATTR_LIST(linear_lookup),
 #endif
 	BASE_ATTR_LIST(packed_ssa),
+#ifdef CONFIG_F2FS_FS_ENCRYPTED_INLINE_DATA
+	BASE_ATTR_LIST(encrypted_inline_data),
+#endif
 	BASE_ATTR_LIST(fserror),
 	NULL,
 };
@@ -1604,6 +1610,7 @@ F2FS_SB_FEATURE_RO_ATTR(compression, COMPRESSION);
 F2FS_SB_FEATURE_RO_ATTR(readonly, RO);
 F2FS_SB_FEATURE_RO_ATTR(device_alias, DEVICE_ALIAS);
 F2FS_SB_FEATURE_RO_ATTR(packed_ssa, PACKED_SSA);
+F2FS_SB_FEATURE_RO_ATTR(encrypted_inline_data, ENCRYPTED_INLINE_DATA);
 
 static struct attribute *f2fs_sb_feat_attrs[] = {
 	ATTR_LIST(sb_encryption),
@@ -1622,6 +1629,7 @@ static struct attribute *f2fs_sb_feat_attrs[] = {
 	ATTR_LIST(sb_readonly),
 	ATTR_LIST(sb_device_alias),
 	ATTR_LIST(sb_packed_ssa),
+	ATTR_LIST(sb_encrypted_inline_data),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs_sb_feat);
-- 
2.34.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
