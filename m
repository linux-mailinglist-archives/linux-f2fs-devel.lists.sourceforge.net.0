Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 877739B49A2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 13:27:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5lJx-0004a7-HU;
	Tue, 29 Oct 2024 12:27:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1t5lJw-0004Zr-9P
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:27:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zS4GPqGXndJK4G7VDt8cMpBOpzTeT34OBTLuih9UEUg=; b=DvCh1hFDDy3AFKEw3fkIaGA+LA
 G7xSHyhQjPy+Dbi4U8l5jjNx1eZ3alyBCUvyljtXr9vsRrQdLf6NbxSA+NqBelJwpC0WybY4pQDze
 y9dP/Ro89hCWAn8qP9XquUxyy750MTBHNj0naY8+zpJ6RGuvrSTXc+W09dozaNhDfwmo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zS4GPqGXndJK4G7VDt8cMpBOpzTeT34OBTLuih9UEUg=; b=LtesXPUuGhrDeBORh4f+1K89hC
 iC4nxd/+6FfAg5HH5NiYohnqNLmEYCEpVah9v/Yilwep5/vzcFl6qq4PIoxYszw8qGCWMtp9TcOxo
 oRtfGrNUr36ct4qGQLtU23AcUOrGKaa/mrIxQK7N0OD3YGHmSsV/+Uhwpb66ekVqD/a4=;
Received: from mail-koreacentralazon11013071.outbound.protection.outlook.com
 ([40.107.44.71] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5lJv-0000f1-5N for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:27:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gthq5It8xjBTlxUd/3f4N8IchBCVhvRECy4jcmZbdHBWIC+g6Jf43gM9Y+rjF27KOE1H36VGc/Vmk3wRgWYTYm5ZRbp3vG0EHCd4AMS4viggY181lUUHdqwemHT68TiS6ydbI62GNqmjGcPXQ/qvZzSC4kaFfCiFd6zC/meiF+J7wPBywA+eV3UgjgSHEJIVZuzBMsfMon2RqTis4bz6QxpjiauiKKNRp8SLcpLc4e7ieyd25hbAT+XohmHkKrKtXww/px5aNEhLOrU0lHkZvfFUPy0TAtWKqsoVoTeFGuIOcpFUumPysYNP7bC6JVKoVl2fBIOfR7sqL+pyLzI2IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zS4GPqGXndJK4G7VDt8cMpBOpzTeT34OBTLuih9UEUg=;
 b=KrRYaKpTf09fbI90XiJ26TZ7abKA7s27YtYIXRWrezCqNAwNyzAbgrkhcqLVp02HCtP0IlcMaGrOZAKpmWqOAc3GZVWOAOMdtnc6djR/QXju/+tlKQmqVj5XsHe74GJP8kN03FWLMNudxIbbIteIRUFcCa7oVXiovcU7WV3USTKqtG8w6yo9YgPSMneu4yJFvvb90rBP9eR28qBPRmkXWP7Kr8AhLcTamdhoiqHOUe0ew6t5XXbAFMeNTyiglNLZG+Aoe2GxiwhYzy5pMhqqjz1dXlTrdSN0hO1hvtjqz9OGLHyANIMSLS8a9WoXj7MGGLAWKQZqJm/i7fT9xDcQyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zS4GPqGXndJK4G7VDt8cMpBOpzTeT34OBTLuih9UEUg=;
 b=cV6hR840qDyxriLo61IbUO0byckEND5+xqtTfqss68ILHycg8rn7jkEMpjQ3cSRnysnk0q683n9xOC0ZEtsS2rCAZ3NY2FwKq5Z713xkXiSxWpm9S20hloOdmBKDnsh8OI5iZyRSekaKrOOcd6MqhgJcaS2ETzjj9SsnwDN8C7Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TY0PR02MB6982.apcprd02.prod.outlook.com (2603:1096:405:e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 12:11:42 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 12:11:42 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 29 Oct 2024 20:09:44 +0800
Message-Id: <20241029120956.4186731-13-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241029120956.4186731-1-shengyong@oppo.com>
References: <20241029120956.4186731-1-shengyong@oppo.com>
X-ClientProxiedBy: SG2PR01CA0175.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::31) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TY0PR02MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: 652cd89b-2dd5-46b7-3aa5-08dcf812d947
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?paeo2ZvKARNV0+F415M8Bq7GrPdd4yGvhwpA4IY+qvrVb5TTS5JN+o/9T2AR?=
 =?us-ascii?Q?IAy3TzkTMB3E3R339Qm00bsluqzap6z9P59w8h4VDwOyKodyAcq5EO1KlTrH?=
 =?us-ascii?Q?pG4YTpMv/yL3ty1KLUzNJXOVTCtOtW5QcB3Ka2ZdCqbww4USV/kvJiAnbKRE?=
 =?us-ascii?Q?aA97nsuCS0yh67ZPSXX13dgAetZq6MfOz/IyFGMsnLk6SW9K4xdzXrz7FM5k?=
 =?us-ascii?Q?cpxVkmy5t+PtV4nLIHATek7sT2QyhZfQdawSazKJ6W62i1kU5HoKygKMpCgx?=
 =?us-ascii?Q?lPc/1FzXNBZL7FYuwxDrqEvL0eoNsoN9rPDW6zfXj/ZG3Ir8HjliLgNUUwDg?=
 =?us-ascii?Q?VYbwe6mq4F+lrlfmN2NYYjnyyFCxlVl13R4mpA6DShkghDhbl0oZpfGw79uq?=
 =?us-ascii?Q?fZCyrm8N1fQRMO1VeRsSmcMMFwfOaTKor0D69p9yNPRffHkYrjziCh8KqOvk?=
 =?us-ascii?Q?zKkrP4gPyzJYDa5MlKY6z66CwvjLKAsWdkXgrtrKxj8bEOCSHQ9BIbSbrDn0?=
 =?us-ascii?Q?T9abCLBrnsHZNUa4NtSh84640dqWIwO8tUl402fYxb0NKNIebdfGEZPf0hV/?=
 =?us-ascii?Q?0JpPVCrU3YCMvW9atFC0GaDMKrK68wLQCjjdcmrSn/1IU8fwtcr3PXE6CO1y?=
 =?us-ascii?Q?BNL9wb0S8Wl3CFfWQiaIxH1Mwycbcd8UG4boXpMbow+zRMPy+41+4lf6Zt8R?=
 =?us-ascii?Q?36mY32+tPt+/IT7F5VozNEbTdgdDV4qgtOrctr48Sv9E0ljsE5hAyE9nixYO?=
 =?us-ascii?Q?LMQApjFrDTv/FIdREuToF0TG3A2UobW+Y8q7poN58nLdxM/DDOHVfjdeYEO6?=
 =?us-ascii?Q?1wpOetEICO/upTRHh+776Jv9d5DifBAzgIOLCkmjeHaARrOayLwTulgloMIa?=
 =?us-ascii?Q?v9Y86OjJ7a2RxUwky8emQUQT/awtpvjrignRW4AbitOUMLsr4EbaofwrvRwH?=
 =?us-ascii?Q?G1LHGgG9q9bOkp7zy0Ku8VHY8VEqDq06z0u+604Baa59pUZh7JNocvAe6D+q?=
 =?us-ascii?Q?sDIiSc5e99Bhlg0RzwwWX9aoHvkHKlCRulgKgRphY9DQQ7OcQsWSkvdg8Lee?=
 =?us-ascii?Q?lCLzYJvdbRcl4tYQcYYR1+0wSzotffM/mtRVS6Zk5bBDq/MfHDRu58h/7s8e?=
 =?us-ascii?Q?8x7Cvkd6I9xtL/cSpmRhi4tUvZq0KkYRhZhnYYIW+ED9jcMovnTc2tULUxGX?=
 =?us-ascii?Q?X3SJK8iAq5NOhTRRLfoo7Ah6REfOFBLIpmpWun9xrvTs8g6Cln4wBWYsJT0P?=
 =?us-ascii?Q?/1JGUSZZZ6EShBBCk7x+e9g4mrx/fE9MVa9/UrKmGEYOGqdmCuhMIHMNWHaI?=
 =?us-ascii?Q?RCn67cHfc6ar0HP8G4w8UHqgrNMCm87Pqeh+HX9MHD9V3ps96Mt2LtBnVQeu?=
 =?us-ascii?Q?2QJ8TM4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fho289C6xRykhnqz5bKt57niIfQ9G3210ISo4Hq9Fh7mBmTAVh78DYV3K3vR?=
 =?us-ascii?Q?9j7zntUhrA4SWy5U7+fBAJNEOMQ2z+9ES4Zt7Up5vs2IceuUQCe+des6rjyQ?=
 =?us-ascii?Q?whVZDtW6Fgpf2CD7/Am4c4eliHTzKuADLW8JoFkECCn/AViBNNTUEXxclk6i?=
 =?us-ascii?Q?Ii2KV8Pf4M4uLMfFJhsdxaisG6quLIwdan2Tv1qFviQanNOLe8YBwsujlLKU?=
 =?us-ascii?Q?4ad8At9i4LcP7A/yVnF2/qctsIOjDadDcpmz1IYyCXOl3Rh1c1B9Vg0RcID9?=
 =?us-ascii?Q?399GP2+mHqv6lMg7CU0waASG+Re5tVzuAupfn9sttV9YOhHfaJOFXiZA+hQt?=
 =?us-ascii?Q?uYOiE4MVtqLpBamBZOmycO2ikgTn9rwk7bNLH+rXXCcgIBEt/3inyVQJh48/?=
 =?us-ascii?Q?0MjE7ZwmCaJ1V78Xu2sYTkV7v4yxKSN/t0FBwtt018zj8KxlD2zGEnipWD37?=
 =?us-ascii?Q?pmYII3v6wOS5QynZ7zRWgQsPKBYJdV3lK6/GpP6k5hv2zzQizo/nvTLkonDP?=
 =?us-ascii?Q?97Rcm2mwphR+g9XkwGg1KfeZeapk26Z9iOB5wkc3q4qeAHiav0ADzeg3HQ4G?=
 =?us-ascii?Q?pwXUQXMlML6WkLTWkzkyLfXkDaJXKYkwUkNXYVm4Nu249jq7onaRRVEanxrt?=
 =?us-ascii?Q?CyKp6YZWT3ekyqzX4/srwkt/9Fmf6YEwUioCZJHLZZBjkvZoZE17s2Yv5/MW?=
 =?us-ascii?Q?WqUEarMPC/KMaP2s3CKgF5fT4vtmjq03uRYJFWLrO/Dfqq2aBZvnRZhN782O?=
 =?us-ascii?Q?s9+WLWPpG6SDtaLdiIZTFQPObh7EN1hvL+NYMv3eaNmIHWop7NYw94p4ZOp2?=
 =?us-ascii?Q?XR+3Lych8Jagb9u5T+K6/XfhYaKTAEau/C8+0wrGESE5sS1OFe1tlenlBau1?=
 =?us-ascii?Q?SQcx7SeHhgXiD8rZNjH39FB9ztVCbf0n5ZAD4tFMKA/Mr1ddDoZUMVEWKMMj?=
 =?us-ascii?Q?UtT8raC6kBE1KdvCTBV0jS6c7Y/cUS8viZxa5idMcUst+Ave5X4t8yA75j1l?=
 =?us-ascii?Q?xeK0OMeRUdCfn1vY+k17SyoQq/Yy+CDkukBtbHO+vcqarua1WjCmNk+UNARq?=
 =?us-ascii?Q?PCqlLDvyYb0xnIlSCeOTfaH20V0u8hmbn4O9YoXbHDfumwnSFur28TfaWBZu?=
 =?us-ascii?Q?oBw/jxx3Q0n8qwRnm6AoUJxWiXKjNFxBPvQZGKtHk6juiFIRjYa8bI2US6Rs?=
 =?us-ascii?Q?s+xD4zwJJ+MJh996mPHVqDsY3n6hv9wm5TJBCayIUbqe6M7j2fIEl8DvJ1Ro?=
 =?us-ascii?Q?rQHU9Ysh4yonGCUFlErzrcpVET4w/VKBXdBXtl/hFIxkiSi3reP9h8lI5NB4?=
 =?us-ascii?Q?YYY/FweYy6WXNljiw+dwm0415zX1hqqIAO/xfmgMA+d5JL//1BkMgTkrD6y7?=
 =?us-ascii?Q?DB+ss3eq9xmnMm1XIAAY6mJVBmVGCLxsyVjNht+TojfOJsKWbZOrKB+b3xb9?=
 =?us-ascii?Q?lUV6Dh7ip028SgMmblXvQgAycFF/QTSvSR7Pvwnqnbw+Z0sI9bwxQNvYeA6g?=
 =?us-ascii?Q?m6GZFLQuyZeeloMfCxhRRD7FAZZcwtVDxZHP0YJrCGoM0PjhA8G8oOutBuSD?=
 =?us-ascii?Q?ouU5uHRjq0yEEOpowdIle8Cswmv6v8nQpbL4MLBY?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 652cd89b-2dd5-46b7-3aa5-08dcf812d947
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 12:11:42.0007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oS/5+BTeyHUdqGM9sfhxhBtlTjB+paboxKJC9/FUfUh9psVY0eHX7NvqyHRwRE/e5MxddbFgPqo8LqjGai2uTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR02MB6982
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Sheng Yong <shengyong@oppo.com> ---
 tests/f_nat_bad_ino/README
 | 4 ++++ tests/f_nat_bad_ino/expect.in | 39
 +++++++++++++++++++++++++++++++++++
 tests/f_nat_bad_ino/script | 39 ++++++++++ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.44.71 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1t5lJv-0000f1-5N
Subject: [f2fs-dev] [RFC PATCH 12/24] tests: add fsck testcase of fixing nat
 entry with invalid ino
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

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 tests/f_nat_bad_ino/README    |  4 ++++
 tests/f_nat_bad_ino/expect.in | 39 +++++++++++++++++++++++++++++++++++
 tests/f_nat_bad_ino/script    | 39 +++++++++++++++++++++++++++++++++++
 3 files changed, 82 insertions(+)
 create mode 100644 tests/f_nat_bad_ino/README
 create mode 100644 tests/f_nat_bad_ino/expect.in
 create mode 100644 tests/f_nat_bad_ino/script

diff --git a/tests/f_nat_bad_ino/README b/tests/f_nat_bad_ino/README
new file mode 100644
index 000000000000..b97015297b25
--- /dev/null
+++ b/tests/f_nat_bad_ino/README
@@ -0,0 +1,4 @@
+1. create f2fs image
+2. mount f2fs and create a regular file
+3. inject ino in nat entry with value 0x12345 of the regular file
+4. fsck fixes the nat entry by nullifying it
diff --git a/tests/f_nat_bad_ino/expect.in b/tests/f_nat_bad_ino/expect.in
new file mode 100644
index 000000000000..99ad7705fd47
--- /dev/null
+++ b/tests/f_nat_bad_ino/expect.in
@@ -0,0 +1,39 @@
+Info: Force to fix corruption
+Info: checkpoint state = x :  nat_bits crc compacted_summary unmount
+[ASSERT] (sanity_check_nid: x)  --> nid[_INO_] nat_entry->ino[0x12345] footer.ino[_INO_]
+[FIX] (__chk_dentries:x)  --> Unlink [_INO_] - testfile len[0x8], type[0x1]
+
+NID[_INO_] is unreachable, blkaddr:_BLK_
+[FSCK] Unreachable nat entries                        [Fail] [x]
+[FSCK] SIT valid block bitmap checking                [Fail]
+[FSCK] Hard link checking for regular file            [Ok..] [x]
+[FSCK] valid_block_count matching with CP             [Fail] [x]
+[FSCK] valid_node_count matching with CP (de lookup)  [Fail] [x]
+[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [x]
+[FSCK] valid_inode_count matched with CP              [Fail] [x]
+[FSCK] free segment_count matched with CP             [Ok..] [x]
+[FSCK] next block offset is free                      [Ok..]
+[FSCK] fixing SIT types
+[FSCK] other corrupted bugs                           [Fail]
+Info: Duplicate valid checkpoint to mirror position x -> x
+Info: Write valid nat_bits in checkpoint
+Info: write_checkpoint() cur_cp:x
+[FIX] (nullify_nat_entry:x)  --> Remove nid [_INO_] in NAT
+Info: Write valid nat_bits in checkpoint
+Info: fix_checkpoint() cur_cp:x
+
+Info: Force to fix corruption
+Info: checkpoint state = x :  allow_nocrc nat_bits unmount
+
+[FSCK] Unreachable nat entries                        [Ok..] [x]
+[FSCK] SIT valid block bitmap checking                [Ok..]
+[FSCK] Hard link checking for regular file            [Ok..] [x]
+[FSCK] valid_block_count matching with CP             [Ok..] [x]
+[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [x]
+[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [x]
+[FSCK] valid_inode_count matched with CP              [Ok..] [x]
+[FSCK] free segment_count matched with CP             [Ok..] [x]
+[FSCK] next block offset is free                      [Ok..]
+[FSCK] fixing SIT types
+[FSCK] other corrupted bugs                           [Ok..]
+
diff --git a/tests/f_nat_bad_ino/script b/tests/f_nat_bad_ino/script
new file mode 100644
index 000000000000..18db1db97b03
--- /dev/null
+++ b/tests/f_nat_bad_ino/script
@@ -0,0 +1,39 @@
+#!/bin/sh
+
+DESC="nat entry with invalid ino"
+
+. $TOPDIR/tests/helpers
+
+cleanup pre > $LOG 2>&1
+make_f2fs >> $LOG 2>&1
+
+mkdir $TESTDIR/mntdir
+safe_mount $MNT_OPTS $META $TESTDIR/mntdir >> $LOG 2>&1
+if [ $? -ne 0 ]; then
+	echo "cannot mount f2fs image"
+	exit
+fi
+touch $TESTDIR/mntdir/testfile
+ino=`stat -c "%i" $TESTDIR/mntdir/testfile`
+safe_umount $TESTDIR/mntdir >> $LOG 2>&1
+if [ $? -ne 0 ]; then
+	echo "cannot umount f2fs image"
+	exit
+fi
+rm -rf $TESTDIR/mntdir
+
+blk=`$DUMP $DUMP_OPTS -i $ino -d 1 $META | grep nat_entry.block_addr | sed 's/.*nat_entry\.block_addr\s*\[\(0x[0-9a-f]\+\)\]/\1/g'`
+
+echo "ino:$ino blk:$blk" >> $LOG
+
+$INJECT --nat 1 --nid $ino --mb ino --val 0x12345 $META >> $LOG 2>&1
+$FSCK $FSCK_OPTS -f $META > $OUT 2>&1
+$FSCK $FSCK_OPTS -f $META >> $OUT 2>&1
+cat $OUT >> $LOG
+
+INO=`printf "0x%x" $ino`
+sed "s/_INO_/$INO/g" $TESTDIR/expect.in > $TESTDIR/expect
+sed -i "s/_BLK_/$blk/g" $TESTDIR/expect
+
+check_result
+cleanup post >> $LOG 2>&1
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
