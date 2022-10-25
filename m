Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC4D60C45D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Oct 2022 08:57:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1onDrx-000894-6S;
	Tue, 25 Oct 2022 06:57:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangdongdong1@oppo.com>) id 1onDrw-00088x-HV
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 06:57:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Content-Type
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8QBoIcBV0ym/ZW3SRDwZrRx/PJPD6EmYXQ8snYK9Wzg=; b=VbkB7npVZW16D0QK50fmZzdnzF
 QlbhfpGiRqwEg9RQKneM2jiGtamaoMKpplsbL8sR10+tzRF9PcdVcnh7Fg1houvFsY4NsDA3HMzbn
 JxxUeI/qP7nrXdtjJJKce37fvv6BHQmVP6Z2AUgMKH1DGQL3epS/0IO9j7wspnznDqz4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8QBoIcBV0ym/ZW3SRDwZrRx/PJPD6EmYXQ8snYK9Wzg=; b=A
 XySj/41JIAQcsDqLVgFbxSCCcWLw2fyY8hW2vq614ZQ4P8GoPggHh3vdS8poC+eDgG9Qw2/zz6KxB
 knaBEmzCvCkH5qSAyKO7NaBFqCH1mMz4sORqWDB5Vq+Jv+1JEyLISkml/y+tpxPSnPckwvaAO6m+5
 QJFqP8Krtuy+BQwY=;
Received: from mail-tyzapc01on2077.outbound.protection.outlook.com
 ([40.107.117.77] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1onDrs-0000oz-SB for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 06:57:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lhp+HIsybUGxFcJRh4PkKPb2aLHdApDX9eKvsvnukip8xOlBjhsGsh9iPsoIyBNa3B/xOu6lnNHigL+y5EO6+bBH7raHrHFeT3kUlVOR3AbkybFsZJVroHEDsJx6fCNA7mcBRZ1hd+08Uvr8M/xg2/gtGfcMRyJnt9r8SnuyhJcxTTn6yGPn6X+6vte7P7bxcUgTEpR5Pe878/YVTP8bJ1kXZg05E3b4JOFvvDmD19Nw0e8uawQDwqb440VHMZa1UYOUbhRK60jplQrOpI8AbvMvRaMJSrfW9Sz04c5ljOBA5Pgby4ZhBtXWh+8J7gGHpCn2jYdjKUeTmK+e9OsIWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QBoIcBV0ym/ZW3SRDwZrRx/PJPD6EmYXQ8snYK9Wzg=;
 b=As4DQIy/+/KDmQd4Arkc7KT4iHYMXHeZGZ4RY2PJsUhUyjq5dvEL96idNIcfAPDTIzzjQw/78t7LSF7C//e2KzxCuLLsb/1G+MTN6PHLN3d5b9AH2uV9LCaILsy5oTOzwBlzqm+SOe1PiF+a3RtyzIsvSZORyxHxUTxkWjvqyYnwlvTFV5WJDpr435YFIaQ+pNxMpE2oIxk++7DWU5JOFuZ6hKlbqk1T3ClTNbMEiUVUMW5z+ePDCMhCfeGO4/EwyYBUck7pLLKVkfXBrVlHfRHbYCjc0OzkRxLAbMJ4Y6mZrgZr8P9I+qAwF3ai1Rdbg2W25/r7aD2Lrfl4qgho7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QBoIcBV0ym/ZW3SRDwZrRx/PJPD6EmYXQ8snYK9Wzg=;
 b=QbN0ZjMuADQPBOQbSsMdqk877cps8oBCjeXc/rB2+piLHJ280eoQ2sMwjFw8kINFWGd3JkHJBDFz3d7qcwcAW4RZ85t7sM3r49gA1yHPhfj+qzYGKApi6WE+hPCGU8clRomsTmCGaFW30j42iwUpmnSv4rMCVMjEBkURs5Qs3eg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB5129.apcprd02.prod.outlook.com (2603:1096:4:15e::10)
 by TYZPR02MB5246.apcprd02.prod.outlook.com (2603:1096:400:83::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Tue, 25 Oct
 2022 06:56:45 +0000
Received: from SI2PR02MB5129.apcprd02.prod.outlook.com
 ([fe80::711d:e5bb:1951:139e]) by SI2PR02MB5129.apcprd02.prod.outlook.com
 ([fe80::711d:e5bb:1951:139e%9]) with mapi id 15.20.5746.023; Tue, 25 Oct 2022
 06:56:45 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 25 Oct 2022 14:56:22 +0800
Message-Id: <1666680982-372975-1-git-send-email-zhangdongdong1@oppo.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: SI2PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:195::18) To SI2PR02MB5129.apcprd02.prod.outlook.com
 (2603:1096:4:15e::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR02MB5129:EE_|TYZPR02MB5246:EE_
X-MS-Office365-Filtering-Correlation-Id: 574f92fb-43ad-4e6c-0d5b-08dab656144c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rD4XS5nWLW/SogifjPRUzm6+l+BilPdc14FhVInkUtu/n9AfYCP0zupc0dJDoxDCIAoHwJBR8x+iCDj+KAtQMqMZQKqjSBL9nEiODzM0ls+vhNV8E1uDTS378bQm89zmdR+BH225GdASLmRbNEgla3wGPpMmEcxNuynjfZvPjAsvpcmfoFEIZS1boQwEepXMA4ttB9tw37dXjchz98y3JnKT+zWFEy9WYQQlbNA/LqsyH4Th3oPocRPBDYJu7hZpJJz3NzxNp4sCmlesNtU8ePb/UFu1HlmacXW56QptLoQVRQ5P30fCpe8dqHCORm7DoR/hZGjmkX3Ixa+/xkynmEwiFRPkRORxifb+zGDY8NqgUvlPgEylu2PT/+SeaJtU1u/R7Q8RUg54sG1beWs3gdwpzYnB8deO7NwUhvZf6lUmpeGfHIOg0G21Kf9TMn/66vIBS2sfRAoesVN8B09LxpFYl0RS5PgM+QZwFGz3X6pxYdhQL43IiPVnAtd0pLcEz4qmIP1V8v6Q5ww8Nn4FF0o8fC5jedJFP0HJ/ohZSMJUTBw3zzEhn2Wug5fWQvToduhAA0yb+kP3BBBpVlxaR5Fb3VTkMOFnuq2rT6pr4UBCK6gMm+COTAqGfEf2B9sWUAsJeNU0F0jm09B7k1BYJNhoA8C1dFiAMq+kkT2Sshhf421PgV3xXNYJiMY7fAS+D9bBEJJvAkcm54vUsDO9fq9wLkCNsj/5gLZofN897dR7LbYOGqLnaEKs7T1U8YhxbbIfUYem/LQa14VwBvsCbA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB5129.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(451199015)(38350700002)(86362001)(38100700002)(316002)(2906002)(8676002)(6506007)(5660300002)(8936002)(66946007)(66556008)(66476007)(4326008)(41300700001)(83380400001)(2616005)(186003)(52116002)(6666004)(107886003)(478600001)(6486002)(26005)(6512007)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3NhNTh2UmR3bGJGOXpwUDBXVDhmSEkwK1Y3bk9OME1EK29lK1A2OEZFM09Q?=
 =?utf-8?B?alpRSVV5MUNqT3U4STd2VGgxNnIwa1FLSE9sWkEvOEN0eTlLM3RWYU81TEQ2?=
 =?utf-8?B?UUp5RnBhVlcrM1RTNVdiS2t0RCt2Y002YmRPYnFidm5BeVNnanVPK3ZiRm1R?=
 =?utf-8?B?UzFmT0cxa3NianVyVVBYSks4Yko0THpnYkF5dXdhZlh2bk5ySGEzSUpuclg4?=
 =?utf-8?B?U3B5NS9xNjdJVjMzOUtTTmUySXNYSEwrNVJ2dXhhSnh2ZEIwUXR3NUhQWWVx?=
 =?utf-8?B?Z29Qak5qd3MyeFZvSC9DTUJxVnB2VGgvYU9rdVBqWFVXOGJyR2VIODFOQ0N2?=
 =?utf-8?B?S1RvSGYyeTQwWFM1K3Vqa2QrZUhpRUc3UWEzK0FVNVFDVTVQbmYrWGI0clk4?=
 =?utf-8?B?ZElYVVI4WUVsMkd6Zkp2bnpaMkVlV1VRbzBKWEZkZjliMFo5WVZ0Z3ZBa09S?=
 =?utf-8?B?a2Q3US9mZjR0UDk1TW1BOU1xRW0zcUVPcGk1TnhjMzVMR0tPMGlEU2lqUndG?=
 =?utf-8?B?Ykd4ZDY2Mms0Ym0vUjlBSlJmQjlnSmtYbGh2UXh2RmNQSE1SU2F3TzhnUTZE?=
 =?utf-8?B?N3haTHNaWU5ySXhFVk41b21kenBDVGR2MmVFc0UzRkVLOVZCZ3dxRDE2blg0?=
 =?utf-8?B?NHVRQmhNYXpLKzBBYkRsQnJmWVpnVG9pLzJuNEppbERYQzVvaEZNck5mbkNh?=
 =?utf-8?B?b3NXSGlpbk15M3BGSmVnT2c0TWVZakxrVUlOQUVZRGZFMzZ1Q0dkK1V4S05D?=
 =?utf-8?B?TnRYMWVCVU5uVDhZdVhuTEhVYThtVEsxUEJJdVdvN1d1T01WMi9hdXBhWnc3?=
 =?utf-8?B?WWlIeWlpWk5qVW5CNVR6aDhpeEg0SXgyb1RaRFBSU3Z5UWtFWGhrWWw3c0w1?=
 =?utf-8?B?T0VnQUQ3cDMxQ0crbStOODhVVDc3R2xTZTZ5dGFXSGQ0cnpkcWUrMSt4b1JX?=
 =?utf-8?B?cHNCbDgyMWhQc2pWWFEyL0J3V01qbWhRSml6WVU5UkZBeVlUN203OWZRTUI5?=
 =?utf-8?B?aEdqNnF0OHQveU42WTk2blRHb0hMNFI5U1lpanQwL0NUTmpCYzc3V0RRTG9s?=
 =?utf-8?B?L0EzL3dYbHB1ZGdsSGlPU0gxWVNzNk52RW1WSE43Ky9YN01oWFIzUWFhZ3NS?=
 =?utf-8?B?cFN5WFhxRVJ4bHByTTNNSUozTURVUUIxWTVLRjY4clRROThrTEZDNTlVazUz?=
 =?utf-8?B?OG40ejJsUzMwaFl5Qm84OW1DaE5KNExSTFdpcGRpUmtNUlFhSzZxR0htNHRj?=
 =?utf-8?B?cTk3b2gxcGdEb21HR2FhcG1MZ1dCZkNRVjlXaG83UTd3SEx4ZkZhanVES2pj?=
 =?utf-8?B?Tjdpc0V3RW5tN0JOTWtub05KYjF1a2w2cFp0SVFtWUszOXkwUlVrK0tIMHBo?=
 =?utf-8?B?N1cvekxmcXVLcXM1UEhjNUhxT0lyR0FBOGY2MEhjdHA4TlZMVWlqMDF2MFZJ?=
 =?utf-8?B?dWxUdHF1bjBZT2tjdHJFZDhoWU9UTzlxa1o0L2pHQjZCR3RMNHJXUmw3VU1m?=
 =?utf-8?B?R0IzejJOZE9IWnZpcEx1d3hoN1IvMTNVRnI2aHV6cDlSMWJ1VzYrSDFHT2xE?=
 =?utf-8?B?blV3VXZqcHhzcDQzRDVYbXFnQ1RzSjdpQ2FBMFlET0pwNWY0TldDai9IWng1?=
 =?utf-8?B?TGdNalBLUWVpejZNSnFxM1FSeERTSVNRMnFJN3ZuTFB5dVBpdkx6SnZ3TXFO?=
 =?utf-8?B?ZnVXREJGLzRQSzV1cy9KalE3anl0M001eXRNbmZpa2xLTzZydzhicVRGWGQ5?=
 =?utf-8?B?ckd0QmN0TlV2dU1nSXR1dVdJeFpKSUJyOGQyRmNZb2t6S0lYYVpralBBMTFq?=
 =?utf-8?B?WmRod3BUUE9MaDVucCtSRXorVXhFL2xnaDVHSWdjV00ySlE2THdsRlg2ODFa?=
 =?utf-8?B?ZWpqYk5GZHcxc1UvOU1GOVNmYmpuSlNpOHBHR3BUeFVVZnljcDliem9ybGNt?=
 =?utf-8?B?dFR4RjBzeVlmbHFwRjY3UWZwaHU4bVRRK2lNclRXQUxBNW5Id29WRjd2bERO?=
 =?utf-8?B?QjUyNUxMSjBlc2NYN0d2a0JMT1RRb3A3NW1CYS9RRUZ0RGoxNmpycDRpZ3kx?=
 =?utf-8?B?cUxZQklNMkNibEJMeVFJQlo2NW5jV0U0OXFvWXBUdVBJS2NIcldVd3B6VXJ0?=
 =?utf-8?B?Q1dmZnZsUGsyaS9PYmhJZlA2cjN2R1phT0c3OG5odnhWQUxJWHQ5VWN6dzJv?=
 =?utf-8?B?d2c9PQ==?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 574f92fb-43ad-4e6c-0d5b-08dab656144c
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB5129.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 06:56:45.2192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ysgjGMmeF3CEq0mCeCH5E4x6e6DOhqhrMe1jSGU5RDkEzqrS0sBzscIJffbD8g2P3eemqcsI2vMHmf0cOZMVUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB5246
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  in the DPOLICY_BG mode, i + 1 < dpolicy->granularity and i
 < DEFAULT_DISCARD_GRANULARITY conflict. if i = 15,The first condition is
 not met, it will directly enter the second condition and dispatch al [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.77 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.77 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1onDrs-0000oz-SB
Subject: [f2fs-dev] [PATCH] f2fs: fix normal discard process
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
From: zhangdongdong via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: zhangdongdong <zhangdongdong1@oppo.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

aW4gdGhlIERQT0xJQ1lfQkcgbW9kZSwKaSArIDEgPCBkcG9saWN5LT5ncmFudWxhcml0eSBhbmQg
aSA8IERFRkFVTFRfRElTQ0FSRF9HUkFOVUxBUklUWSBjb25mbGljdC4KaWYgaSA9IDE1LFRoZSBm
aXJzdCBjb25kaXRpb24gaXMgbm90IG1ldCwgaXQgd2lsbCBkaXJlY3RseSBlbnRlciB0aGUKc2Vj
b25kIGNvbmRpdGlvbiBhbmQgZGlzcGF0Y2ggYWxsIHNtYWxsIGdyYW51bGFyaXR5IGRpc2NhcmRz
LgpUaGUgcmVzdHJpY3RpdmUgZWZmZWN0IG9mIHRoZSBmaXJzdCBjb25kaXRpb24gd2lsbCBiZSBp
bnZhbGlkYXRlZC4KCkZpeGVzOiA8MjBlZTQzODIzMj4gKCJmMmZzOiBpc3N1ZSBzbWFsbCBkaXNj
YXJkIGJ5IExCQSBvcmRlciIpClNpZ25lZC1vZmYtYnk6IHpoYW5nZG9uZ2RvbmcgPHpoYW5nZG9u
Z2RvbmcxQG9wcG8uY29tPgotLS0KIGZzL2YyZnMvc2VnbWVudC5jIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZnMvZjJm
cy9zZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQuYwppbmRleCBhY2YzZDNmLi4yZmNiMTQwIDEw
MDY0NAotLS0gYS9mcy9mMmZzL3NlZ21lbnQuYworKysgYi9mcy9mMmZzL3NlZ21lbnQuYwpAQCAt
MTQ0OCw3ICsxNDQ4LDcgQEAgc3RhdGljIGludCBfX2lzc3VlX2Rpc2NhcmRfY21kKHN0cnVjdCBm
MmZzX3NiX2luZm8gKnNiaSwKICAgICAgICAgICAgICAgIGlmIChpICsgMSA8IGRwb2xpY3ktPmdy
YW51bGFyaXR5KQogICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKCi0gICAgICAgICAgICAg
ICBpZiAoaSA8IERFRkFVTFRfRElTQ0FSRF9HUkFOVUxBUklUWSAmJiBkcG9saWN5LT5vcmRlcmVk
KQorICAgICAgICAgICAgICAgaWYgKGkgKyAxIDwgREVGQVVMVF9ESVNDQVJEX0dSQU5VTEFSSVRZ
ICYmIGRwb2xpY3ktPm9yZGVyZWQpCiAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBfX2lz
c3VlX2Rpc2NhcmRfY21kX29yZGVybHkoc2JpLCBkcG9saWN5KTsKCiAgICAgICAgICAgICAgICBw
ZW5kX2xpc3QgPSAmZGNjLT5wZW5kX2xpc3RbaV07Ci0tCjIuNy40CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpPUFBPCgrmnKznlLXlrZDpgq7ku7blj4rlhbbpmYTku7blkKvmnIlP
UFBP5YWs5Y+455qE5L+d5a+G5L+h5oGv77yM5LuF6ZmQ5LqO6YKu5Lu25oyH5piO55qE5pS25Lu2
5Lq65L2/55So77yI5YyF5ZCr5Liq5Lq65Y+K576k57uE77yJ44CC56aB5q2i5Lu75L2V5Lq65Zyo
5pyq57uP5o6I5p2D55qE5oOF5Ya15LiL5Lul5Lu75L2V5b2i5byP5L2/55So44CC5aaC5p6c5oKo
6ZSZ5pS25LqG5pys6YKu5Lu277yM6K+356uL5Y2z5Lul55S15a2Q6YKu5Lu26YCa55+l5Y+R5Lu2
5Lq65bm25Yig6Zmk5pys6YKu5Lu25Y+K5YW26ZmE5Lu244CCCgpUaGlzIGUtbWFpbCBhbmQgaXRz
IGF0dGFjaG1lbnRzIGNvbnRhaW4gY29uZmlkZW50aWFsIGluZm9ybWF0aW9uIGZyb20gT1BQTywg
d2hpY2ggaXMgaW50ZW5kZWQgb25seSBmb3IgdGhlIHBlcnNvbiBvciBlbnRpdHkgd2hvc2UgYWRk
cmVzcyBpcyBsaXN0ZWQgYWJvdmUuIEFueSB1c2Ugb2YgdGhlIGluZm9ybWF0aW9uIGNvbnRhaW5l
ZCBoZXJlaW4gaW4gYW55IHdheSAoaW5jbHVkaW5nLCBidXQgbm90IGxpbWl0ZWQgdG8sIHRvdGFs
IG9yIHBhcnRpYWwgZGlzY2xvc3VyZSwgcmVwcm9kdWN0aW9uLCBvciBkaXNzZW1pbmF0aW9uKSBi
eSBwZXJzb25zIG90aGVyIHRoYW4gdGhlIGludGVuZGVkIHJlY2lwaWVudChzKSBpcyBwcm9oaWJp
dGVkLiBJZiB5b3UgcmVjZWl2ZSB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0
aGUgc2VuZGVyIGJ5IHBob25lIG9yIGVtYWlsIGltbWVkaWF0ZWx5IGFuZCBkZWxldGUgaXQhCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAo=
