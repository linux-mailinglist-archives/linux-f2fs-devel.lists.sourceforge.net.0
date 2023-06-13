Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC1E72DBE7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jun 2023 10:02:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q8yyf-0000r4-TH;
	Tue, 13 Jun 2023 08:02:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1q8yye-0000qu-HS
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jun 2023 08:02:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WASiI+LGr+j54QgtHqz/Mb0c0vmWaC6GIOI+FQCQgEU=; b=TVI6NH40Qh+CS6HZiavzEwrajp
 jD6hGIB1aM2UkqQgO9r5rhOAJSaH/TqtnKoAS2riVggoVuK5qxLatr+v2yEwWHdB0JObQbVaT77G8
 PY/fJx+mBgRhu5Is2JsbDJEQ8K0KgQcGMcNEABRPFFrhvSAJhibVOC7CQAgaMQZFMD8E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WASiI+LGr+j54QgtHqz/Mb0c0vmWaC6GIOI+FQCQgEU=; b=QcAXtgpemxNzQmr8TKn5miW6b+
 h/PLK4yj0jTCvuFBR+ypDNNBPMctqShBI6+IO3uOF7w+7rcSnQ71Y+LToeXfBdHTtcIr1L20bgTmC
 lByAbw4nX87Im+EcEDf46spNq7EfKaqOIfROJzRRRGjyRRcKYJp8btQEDUqj+hI7UDXs=;
Received: from mail-tyzapc01on2125.outbound.protection.outlook.com
 ([40.107.117.125] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q8yyc-001XWM-N9 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jun 2023 08:02:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZvgncqonQty9SlmwoKqyvkztZ+7MlX6/C6j6naTPjMeJ3o3oBhWloeIIPRryhU9Foe1A92JYjf3O8xKP+C0s2Cliwi7c2smW1/Os9MU4P7kx7AgiLKitVuJNCUQBCPwnn7xx7Nmbp/8kg71RTYoJTFkSsAFmFwlOoPUd0/chK58rlBrRHgyN/SBxhaE8vDjhgM3EcZAGhnmY9kaF8xn4lNba24GC6NCqGp/fc4Ttv52hhoJwKz3mJtRmAPeGBt7FKc7ygoRhJNVLoQK9b9XxGVvzWJl1Riru23oqwgVtnUHwaX0VjnbiublXRYZxTNvUg6EP7qbQp2C/SI5QI+jWZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WASiI+LGr+j54QgtHqz/Mb0c0vmWaC6GIOI+FQCQgEU=;
 b=BDJ2bCwkLtHTFDagUojtEDURjYkrqwmghpxXQfGCcqFhTaC4Juge0IGYmtSygPQYtOyAIQW9GRRUf/ol8pGDcIhlgUps8cacVw9nIL5raoOEa59tUBhNCGMRE+ps9SCj57MJYUVvg7PmpdooW7lLUvd8RMj7BgxsAjITvckgT4QJXlvC7JDIqNSG0M72utbGCoRAYFhEIbUhTRe4iwqdgsElbqSqyHArm4bslTc6fGW28/ecmEbELrL5cpBfckIwRK9xnIFTrHB3GucslYiUh1heCZ1vQEeaGWagx4MovA1g3+fIIDmUoMxQQb83Og7baxSLlE23fvQzbPAZXvhrsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WASiI+LGr+j54QgtHqz/Mb0c0vmWaC6GIOI+FQCQgEU=;
 b=TrV+Fy5ipErdoMF9oGf+oR2gQUfTXmRa1qguuGAfR8xK1jrGFuSY5vA77wKNcWp/eLtVTPaoPslp3SmEKTslGGxxwrSChAXoMTlFCRvblD01RO4t1FfEPp35eIVZumdn18Zx8glDhBC7+kaOfdegdgqoXzWGIJl5ZKclIAxQIDLEt/JodV0XVjuClqRye9KEWzDvwcn45rIaAla3NmRdNgQgqMaKPVDD9NhnbrSbjhgY2D8SUE6YFj6me0B/ErkazWyhnD404jjKqPyvn1rmgMlUzIiLGDGJe2jaNwGeGeui6K7JYiLaPpeXMUgqTbCnzd0mos9XaUn8Uv1pJT9xog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEZPR06MB6667.apcprd06.prod.outlook.com (2603:1096:101:17d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.38; Tue, 13 Jun
 2023 08:01:59 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%3]) with mapi id 15.20.6455.039; Tue, 13 Jun 2023
 08:01:58 +0000
Message-ID: <b42482fd-debd-1939-f129-4867017f0ce2@vivo.com>
Date: Tue, 13 Jun 2023 16:01:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
References: <20230420062207.26879-1-frank.li@vivo.com>
In-Reply-To: <20230420062207.26879-1-frank.li@vivo.com>
X-ClientProxiedBy: SGXP274CA0010.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::22)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEZPR06MB6667:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c6ad287-42e0-4ea4-6c67-08db6be4763a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GX3BVmR1u0JdKn7W6IQx2kz/sOHhUdDiCodi/Wzf4C1GUCLaeOY1Jex07nHC1XIxfdf0R40xa+y73JFC9b/3hbuRNC6YXyClzbZfDcMvjpDFwedRgJdN+/RThyAX5wbxlyIR4kQYKtg1xoX3Dz3U3C0OeEwhS/xAZOb5ANCSXq0YOtRMxxFv5iooS4/nFJO1EaCMGvG/8m5nprR7ObjZuPaPlcDrqFYGi+TtUVU/HmL8uIxnmGGO8gPekSVp2VQw+ewbQHf+gJVARhEZUJw4fngJHGzaZSRRJkLoRwJ29jfojQrfy3skdb64Wvn5pqn1+yf052MjCGBbzOeHNr6QQTKMImhWrgSEKApMwbvUdBhhX9GO0c3S5RaVNlSeipP+VdLfHduXBxR9+ro6oLklkJDHxwApgxhP8wmNAQEm5sY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199021)(31686004)(26005)(6512007)(41300700001)(186003)(6506007)(6486002)(558084003)(36756003)(2616005)(66946007)(4326008)(66476007)(66556008)(6666004)(110136005)(8676002)(8936002)(478600001)(38100700002)(52116002)(2906002)(31696002)(86362001)(316002)(38350700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3hDWmRKaWtpRWlvMWdOZm5JMkwrWG9FVUpEZ3hCN3R5VlpYTUdWKzhNcDdY?=
 =?utf-8?B?WkpiMHN1Sms2MmFDVmtZZE1Vd3l0QUZ6a2hENGkxUFczYW80OVcyTnh0a3Va?=
 =?utf-8?B?eUFnTlV0THlHMGNMRWZldUlUQmxZQWNmQTBSYzJvV0hLSzBTTjZTeEMwV0ln?=
 =?utf-8?B?dEZ0dG5HN1hCNjE3c1l0b0lrdmwvT1BMQ3l2bWN4Nmg0Y0RFbitkdVE4KzlI?=
 =?utf-8?B?ZjJwWEM1ZU8zY09Bd0pOQ1gxc3Bkc1FBSjQxdEVtNTl0RUNlN1p2Lzd5TmpH?=
 =?utf-8?B?UlMwcm5jdlFWZjRMLzVqeGpiOHNObFY3ZlZNampFR1ZyVCsvSUgyS2c0K09B?=
 =?utf-8?B?dzZRRUo5bkVlRVRtSGxkVitndUZ1eXdyTnZzY2hUaDBlT20rRW9GZit4MUtZ?=
 =?utf-8?B?YWRGeGFPdUYxNkpWQVcwRVA5TS9xYzJHZ3lCSUhaQXNYU3R6Zi92ZkxaMGx3?=
 =?utf-8?B?WU0rdUxvRDNWZVozckFnZlFJSXZCejUrZklnYWdjV3l0ejRvTkZjVW9pY2RN?=
 =?utf-8?B?eU1iakVaZm5aRVB3RkVNUUNUQmRMY0lEeEVBMlJvYWFqMmU1a1FoY1dORFpQ?=
 =?utf-8?B?eW9IT3BlNHRvWUdOb3BGRWtpRmpybUVFendXTDNJR0dWQlQ4aW0wVmRHajY3?=
 =?utf-8?B?T2NYT25QSTd6dFdJVUREYzNDakJqT2oyRjkxQ0FiVnNMQmpCSS9GQ2pnVC92?=
 =?utf-8?B?VlpKVVhIajNycGJNVCsvZExEMGY5NDFlSkF2SmdxalJmYjh2RTMrSzdVSUxX?=
 =?utf-8?B?RVZmc2ZROHh5ZFMwYWFCeFJzMkhHcEhxTXFsblZ3am1JY2pmUGRmZEVhbm9m?=
 =?utf-8?B?WGFtd3F5dTBXVTUrcmhpZzJJYmpJbkIzczVBN0U0dHc5ZGMxcmFmalNRYkxV?=
 =?utf-8?B?aGd6cXRsMG41Q2ZpUUhYdis0dDgvaG1HOVR0Ky8zWDVxSkt5VC9Yd1huR3dI?=
 =?utf-8?B?ZTRBOW96UjVNeEJHVVFybzVweUd6UWpUVGozbW93QlhKSnB2dVN2QzYxMmY0?=
 =?utf-8?B?Ny91enUrenU0SzRpbHR3RnhsRGhCWHFveVRQZThOQ0xNR2NXQkw2WlF0ZjlH?=
 =?utf-8?B?STk2NHoxTnZIamVuTXZ4Y2s5dXpmL0VRRmxyMHlGNEVKY2I3cnFwR1VTa0tl?=
 =?utf-8?B?Sno4QXVnTDZlTTZON0d4QU9jaUpJYVBPUENuYzI5RUk5VXRYalM2S0VVNXhW?=
 =?utf-8?B?WS9OeGtqRDMvY3JnWER1Z1k4aFhQVENCMkoxaFVkSmJ6QjZrclc4TlBUMVl0?=
 =?utf-8?B?QnhaR3E3NlFXMURHYjErZktFQUNFd0NjK2FOWTM4NitmNU42SHZLRG16b0Vx?=
 =?utf-8?B?K1BoSXB3d05qYkxpTWFPNFVvUG9wSmJxOGZvekhFZHBMWWErdEh2NVlkRnBR?=
 =?utf-8?B?b0VnM1JiRktTdlJIVnZpQTNtWmJoZ25iNFVCZ25KV1dwN0t5SmJXTkEvc3E4?=
 =?utf-8?B?NEEzVnRhRDJUVGI3dEl6ZG4wdnB5d2pOZjh4SW5HUkxGNEJWOERSUmpBUE4y?=
 =?utf-8?B?THd5dGhIVWhEbmd5dTNmL2xvVGZQcWZEc0d6bE0rbmZIRlBCWGFhcGdCV0dp?=
 =?utf-8?B?SlRPSzliZlZkNDdSQVBZZUpWWmxITThva08xMkdKVHplYzJsQWhKeVB4MjVm?=
 =?utf-8?B?aEJ5aG1CSVNmQmc0cFE2MDU3L21nSVByNTBtN1FXc2VXM25IeUc3Y3ZlUjJo?=
 =?utf-8?B?U2dTSVFXTXdZWXpzbU9rbHNDWjJiSlI4M3Y5MFlhWHFSMVNoQUJQKytFcXdy?=
 =?utf-8?B?T241ZGx1MmVHbHVGUkUyVUNhQVBiMC96VVk2SlM2Wno0QUFtSEFFVVVDNWk2?=
 =?utf-8?B?aHoyOFpIWDBFeDNvM1p2U0FIYTIrc2RYbTBuYlhKY3c3NTVXMzRYcC84Vkxl?=
 =?utf-8?B?YzFCejd3ZEhFZFNaUWs4SjJ3YjI4Q0Q1eGNMTGZmVFhld2NFUUwzR1p3RVhY?=
 =?utf-8?B?SWVFaXFidWhvd2UyL2pIMWlQc1BVc2h0UHFIWllGNWN1ZU1ZVm14UTd0dzQy?=
 =?utf-8?B?WXdhRFJHandMeTJzVFZqKzBoT29sOGRvVzdMaHZEMWhhRG55aXFRZlk5Uk5X?=
 =?utf-8?B?eWl0R3dCUjRWT0RiaThCajVVU01rcS9NWStQSnE0SEcxNFJGUnE2bEw4Mitw?=
 =?utf-8?Q?5wnhvxCxUv6rIjIibv+FLAwYp?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c6ad287-42e0-4ea4-6c67-08db6be4763a
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 08:01:58.7614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sHCyy6Yin05z0o/2VpLd4f/HH4WummlZXZOi75hBf7lCuad21DukqxLSsj0jbLlBa4QZAO6KjnlNq/WI1Y5mlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6667
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  ping...... 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.125 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.125 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 2.0 PYZOR_CHECK            Listed in Pyzor
 (https://pyzor.readthedocs.io/en/latest/)
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1q8yyc-001XWM-N9
Subject: Re: [f2fs-dev] [PATCH v6] f2fs: support FAULT_LOCK type fault
 injection
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
From: Yangtao Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yangtao Li <frank.li@vivo.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kernel test robot <lkp@intel.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

ping......



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
