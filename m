Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C956D92F3E2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jul 2024 04:02:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sS5bk-000770-8c;
	Fri, 12 Jul 2024 02:02:01 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sS5bi-00076t-IH
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jul 2024 02:01:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3C6SSrpaS3LKPQjgtutJcrUSUPaWGzA0MRxkuXXGmxc=; b=Iwh5RY3Wloa2aj7VkXGbkKaqV2
 OIGtn6zclvAF0WCQXE9V5XRhBxZEVlRYVdzhjlUfMeRJKTH1oZCe8QIutaqBRe3sRUyHd0hOLEHDt
 6hFvSwrPuD8fV8FO7hIVSA1fZg3i0WqL+F9koguCbN175joZaut37fXhxOtp4TjsNw8U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3C6SSrpaS3LKPQjgtutJcrUSUPaWGzA0MRxkuXXGmxc=; b=VbOybqTTKFmPY0Y4+Pf5+7m51z
 csHHXvmFnm3FrjAgkq41uuBEHdESQZKpkvVp1EuZXyboSfWkUQNTIzsuXpGn2pN7biisx6A9Ax1fo
 H06mTmCiAO818bwegsB5TKXnjcei6rA/X7Ra5dQiZXVpQwCDb9UlF4K7hKYAF3p6DNsM=;
Received: from mail-tyzapc01on2047.outbound.protection.outlook.com
 ([40.107.117.47] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sS5bj-0003QU-Po for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jul 2024 02:01:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pc3Zu3B3qGneap871C7M70hUDgCWu61rn/IpB+XWuqSCLY4c5ihKPHKPAXnNh/5edD4YogrfeKlR5Xy61LIxKG5j6sYmg2p8mcUKZ/GzUZoj26ya54qvUBXZUvHYXYoNOIVGGd8RzOa9+wxKZls5T3wYQzYUtP83xkhL0qtIpM6zmzEYe2OeROFHdS8mv1cUlFu6Tbzo5YXLcADfqywmncqnwKm52OK+LFLGKH1eTwgymEuVzQ5L+RsyDsov7c9qe/hHcoA7hpW0uWxqAnRk3wAHQInE1kr8CGLIJwti+ryp8KbvP8bQxmV6bsD4dx+X+OwaBhHwp/gBo8IW/Xn8bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3C6SSrpaS3LKPQjgtutJcrUSUPaWGzA0MRxkuXXGmxc=;
 b=JyrpkEXoT5eDCAZREHoYPxzrk4719Hv2cYXN+3ZQR65tch/VsjaiFFNE3sdma4HmqKGabWE99wu2Ep7T10V0ZHFKXmLxS0w3TgGTQC/g3reE4Sua8bYsZNwp0XqWp+6pfCNghqUI9yuk0ceUxv25zDHLYxY+po8yEUgF5o1m9DX5sFMTJWZa9YRTlO2QiyQWckydFlYmYj93/EWVnT473PyATtuv80FI4GAJ6MKAztmLh+ePeElXO+vPp5KwTQmk6qnaC3T6DCFoRD6ZAxNl7vMUABhNzYZBZ9hi/bbTikMnX/nsk8bNDxHqkfW8Cow05G5meqXiiaNYBJq4xSw1cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3C6SSrpaS3LKPQjgtutJcrUSUPaWGzA0MRxkuXXGmxc=;
 b=NGekKKPTsJkwsBRO//hIjLXtDHe4oSM4cBmttGCPakzTM/3tClLbYdh8d0mm+1VNuNyoJj9wz4AR2LwlXk7UesccSaqqyQp8lHBwsdyTKIgiTbJNeYalUUKfr3p3t6Ld9o4BAM+NR0/jhflwfpabG5lrzPAF8cSTz5byOnMVZBI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TYZPR02MB6621.apcprd02.prod.outlook.com (2603:1096:405:28::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Fri, 12 Jul
 2024 02:01:46 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 02:01:45 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Fri, 12 Jul 2024 10:01:30 +0800
Message-Id: <20240712020133.140148-2-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240712020133.140148-1-shengyong@oppo.com>
References: <20240712020133.140148-1-shengyong@oppo.com>
X-ClientProxiedBy: SG2PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:3:17::21) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TYZPR02MB6621:EE_
X-MS-Office365-Filtering-Correlation-Id: 91f5818e-77ec-4fca-aaf9-08dca2169539
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hqKKaWK2ydVukhScnBoGbzYf9/Qm3w/ckxPPc9cUwMmc4Ts43lf13U4LdcqN?=
 =?us-ascii?Q?f++MBHmGB0FdnT9qUnv+JeBIax3eYP3lSBsg1gdPKNtyv8bhGz7Qx+2kiUe6?=
 =?us-ascii?Q?tXdMfSqvWRpSD6MuooO54RxGusoLgJlgehwwopjytQtWx6c+LoA7K5JAvJ+7?=
 =?us-ascii?Q?4XN8K4X2HF5fDdFhHQeNvpwbkz671ez478TJRK4/PgW53M1Xf8zlvTS9wwJD?=
 =?us-ascii?Q?6xXvaYKijTLrsfsm4AmIborOqjAQ9QsJNTEpCZkVB/h5PSwYz1lyop/Ob8QJ?=
 =?us-ascii?Q?FO6B3cD7apAYyvkL4YBOc0sMgTFcGdxyrmg40jQ315MvI72N/eiYtWqu/Pvj?=
 =?us-ascii?Q?sUiz6UXsErJFi5iGwKjNvDJoyd+EzPKMhZPFj6UZC0llPLE+hqMwG0tAkp+8?=
 =?us-ascii?Q?oK8fngW4uqg5ZJpsI+lebs0EcbhXPUjsEYsHqFraynVIPXru5ZKdI8ygiV0e?=
 =?us-ascii?Q?qK/MD27TENe8i0Y8vDvMHpBmg6k2NEKXkLBkqPxEhMTJSF02Fdob2vRU1kbb?=
 =?us-ascii?Q?OvP8+VZ94kr99wFXoJmDOrCJTh0mR1F3PdTAoEag3MhgzyfiIDW2SCG38xGG?=
 =?us-ascii?Q?fQa9La9jmiWWpMJTgz2ADbnT9AV01UPPEVwfl6LWgDHp8fbJwRTdoWSafd5I?=
 =?us-ascii?Q?xcGokxwfL8PyyRB4WNz8glpNtH30/p0WvEkR3a8DIp2nIecNkeI4m2khYSpy?=
 =?us-ascii?Q?uyZMGTjEFTwkIw0MHwve+e7OZWyrDLzmPXk3GuSOOGZuT0xi6vw5xitO0mBA?=
 =?us-ascii?Q?BUtB+zHleoGsMcOxJf6EiT4i5PrRdmgRGnGKzxmbA6q/tM+C6Z7M0FBzd2uM?=
 =?us-ascii?Q?4QGL/MY0DSm3xgHn9DQOITPeBX8JPwV4Md9dtT95ILZBPwQAxSwVQltBxHIG?=
 =?us-ascii?Q?B9Y+knxG1sdt8YABCcQQ++G8RxlhB/UjPl4d+V2MafyViNm5JNKtTRZUPVRd?=
 =?us-ascii?Q?aF/6ORxX2soIeX7sTJs9x1ejSgDAVwWEOivFsErjeDUm1CXU7FVMQhIlWmgX?=
 =?us-ascii?Q?E1rsNgW4IXg7aHnUE1cfPXrBUkKUa7onHKKMyLcnSUIG8rXRtSAw4kVs+xRr?=
 =?us-ascii?Q?+mju+4btjaoOxxCplaAlMtEx6DfsSxBF++2GfrBFqKmI3Xd7QM2C+Htehwjo?=
 =?us-ascii?Q?fY0dBt5YsxWgeEM55fMNYu5aZJpiagPpLf4plf7HEVnSsOTQzGk6ek9t+lAC?=
 =?us-ascii?Q?QLqVjijgCJ13zBx0bwzEajkiss1q1tg4VG4hhecFl8PJmroeD0B1vFmNrw3J?=
 =?us-ascii?Q?95yg9AK6WFR3aDwIj1Gm03PTeSg7yjSkvVxRAjYuokeRkUYuqDQbmuDNsXg0?=
 =?us-ascii?Q?NaBiH/EEY4zRD5s9rW7/9IBuMy1ZwdYDjQCfmLkjsquUTRxycoS3Akl0+5Eh?=
 =?us-ascii?Q?2qp3i1RoYJvNeFw7utfdMX3SG7NJsA1+swzKkyDAD8fs3GenQA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GkJv6uwK3lJ8URqVFGaFefz3h/8OxkltPvOjOsp6eOMtnWOKL9oJHfPj0YKh?=
 =?us-ascii?Q?t7jf4Mce6bmNL55A8v7tTLfdMFtTN8vAAhf6T/NN95Uu++gA4L5mkh0j6ezz?=
 =?us-ascii?Q?6S6vUmmFcN4AV5ey9UaDT7WFFjd9cm/z4VF/ZsTP/vxWMMKtdTEKD60WfpSt?=
 =?us-ascii?Q?F1YknIs74fI3PDfFSORSx2ETAF5wy0bI0pLcbOnGBAnx8nFi+dgY32v44xw+?=
 =?us-ascii?Q?dslSDTLfE/wEBzbHA+ozBlfVbYa5KIm2NGP/+R/32gB+5cRdbKkDUDAQ0SqB?=
 =?us-ascii?Q?Q18o23D3AWyhdAjDwFC0mkCj3qdYYnKnggEOBlMNuKrjZhImz4injhdbb8qj?=
 =?us-ascii?Q?Jhz8TZpYUZ1kqpd/z3xZSrSm2v5+5hniHck3MeffmrkapRttpgiB1fK4sJME?=
 =?us-ascii?Q?o7CkJ3jyut/7OppflJ4JwvMCHo/ysBUD4HMXF6nWGE+v7rZqvil7BwN/xztw?=
 =?us-ascii?Q?j5PK0rE1LjTqVsUebsjmCzpvGZbFopqeT+ghl6zp8EHJQ4qh+HuMtoRK4gGM?=
 =?us-ascii?Q?Wvi65+lku3ppQHuTKSWWaxUPzL4SiMXuwqQgkoZPUUs2KyFYfq6kwnElpRrj?=
 =?us-ascii?Q?fRFjoS8s8taKlKRP2YgCL6UYQoibukIauAdEaMLtbtpa8ZsGeBuGr699O98Y?=
 =?us-ascii?Q?r2fDCp0pG0HkXGrRyg1tEwAFVpzBp/I1OM33DFV47psGbodVfROR98fuymxL?=
 =?us-ascii?Q?KSMTJb+0xVI7K82QdcMIS4IDMtECG3tdQ+LrSkMz1mFpLE3Z5yUs7kJ1Wc4y?=
 =?us-ascii?Q?0JOQkjSAO1PQAomGy3J/Bts2ut+2KA5HBNreEbyGPidwN/H2mggYSj8FX5vd?=
 =?us-ascii?Q?lhBuKG1APu8MueWtf84LBv2EcokwIblzffRANHi8opCsC2PcWLchLwpUXrpL?=
 =?us-ascii?Q?nBu4/SwwsdnHox4fUWQ53ke/R59OEuGza1CO8LYi98KCT8VSjpgKAUgVTIDD?=
 =?us-ascii?Q?qotXixydJcnEh9YylGXjh2BP3CCUSSp/MqNZhkPhVZR+NhNBOeLgnF5BA+LP?=
 =?us-ascii?Q?B8Kcw0hPEoxPKicYLt16qGNC2et+h6JwIVw7nMoIYsYH/cBV2+ALQ2G2Iqv8?=
 =?us-ascii?Q?4cB3r8ZiVSuowm4HRRFlV7A7H6dMJ3Yh+t0ITqFh8vQtm9ZmjZ3ZonQ3JOTs?=
 =?us-ascii?Q?yq++VqWlbfzBkgou+8XGWegbJDR02Ah9G7KlDIDlQunp03aZkyXFL8QsZ0Y4?=
 =?us-ascii?Q?zt/cSwi58GqHJHoSNc0gncMo5twt6NUqJV7X4AIwYzW5P21p4t+1pFREFaqf?=
 =?us-ascii?Q?RJF5VFYzjSPNeEmJn8UqnR9vLnVTqabuihHHFEVm7ujwKSmMRyXPxWIJJWmW?=
 =?us-ascii?Q?YvXviHCtHvShUMMmUvsKdWygENcBJ3Crk0buf/KkVZx7gPKNUepUv7rsdO3d?=
 =?us-ascii?Q?T8OUAP6KXcXJQy4tPMdrKYVs+ZgXWdViTDZEWddoCOprAnsjrwHqp+GmVkjt?=
 =?us-ascii?Q?+achnmnP8uK97mI+aUFc/mt36IfKjLwOUGGzECiGAB80LMrZfmhIFgH/qeRE?=
 =?us-ascii?Q?7yntDjIVHpmBJPAfPA0+Hye+AWmlnPrxguyihYlvIZTCcMqgmN+IIDztG7HL?=
 =?us-ascii?Q?ZD0yM79Or9Q62pbiB33jjHdM8QZAbJFoKqI2OKhY?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91f5818e-77ec-4fca-aaf9-08dca2169539
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 02:01:45.8410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6BQhltmfzZAiYM/6TSfheVYp/uJzm1g5pqdso2/uaCk1UR8a6YoCNcBLRtiD8nnBdB7y5bqtAZODCCajt+rijQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB6621
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Show multidevice infomation like the follwoing: devs[i].path
 [meta.img] devs[i].total_segments [0x 3f : 63] devs[i].path [data.img]
 devs[i].total_segments
 [0x 80 : 128] Signed-off-by: Sheng Yong <shengyong@oppo.com> --- fsck/mount.c
 | 8 ++++++++ 1 file changed, 8 insertions(+) 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.47 listed in wl.mailspike.net]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.47 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [40.107.117.47 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.47 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1sS5bj-0003QU-Po
Subject: [f2fs-dev] [PATCH] f2fs-tools: show device info of sb->devs
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

Show multidevice infomation like the follwoing:

  devs[i].path                            [meta.img]
  devs[i].total_segments                  [0x      3f : 63]
  devs[i].path                            [data.img]
  devs[i].total_segments                  [0x      80 : 128]

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/mount.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fsck/mount.c b/fsck/mount.c
index 8524335da4da..ad1a49a84109 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -469,6 +469,7 @@ void print_raw_sb_info(struct f2fs_super_block *sb)
 	char uuid[40];
 	char encrypt_pw_salt[40];
 #endif
+	int i;
 
 	if (c.layout)
 		goto printout;
@@ -537,6 +538,13 @@ printout:
 	DISP_raw_str("%-.36s", encrypt_pw_salt);
 #endif
 
+	for (i = 0; i < MAX_DEVICES; i++) {
+		if (!sb->devs[i].path[0])
+			break;
+		DISP_str("%s", sb, devs[i].path);
+		DISP_u32(sb, devs[i].total_segments);
+	}
+
 	DISP_u32(sb, qf_ino[USRQUOTA]);
 	DISP_u32(sb, qf_ino[GRPQUOTA]);
 	DISP_u32(sb, qf_ino[PRJQUOTA]);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
