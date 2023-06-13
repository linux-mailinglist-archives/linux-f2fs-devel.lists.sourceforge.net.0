Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C81A72D857
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jun 2023 06:14:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q8vQa-0005By-VL;
	Tue, 13 Jun 2023 04:14:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1q8vQY-0005Br-B7
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jun 2023 04:14:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5RdESJ6VupJCCNC7WtfoUgADXEL+mT0Ue8aSFRuO4YE=; b=YuEdJ5zbVk3PGhuoyI6mdeHtx/
 6CIVaTpB+Rv9BBLHxTBcOCl/GCNZvI9gvESnLjwMm2hUAagOQ5RX0fq8UxIDKPqDbvNYMELixjXG1
 xFy3YmX3tTn5FpMjyKT9/N5qsDAw2yhYrCQ8j00ytnbwpFNoxpQQ+mnouhQL4hJ0rF20=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5RdESJ6VupJCCNC7WtfoUgADXEL+mT0Ue8aSFRuO4YE=; b=dwkoiCxInR+evY+cCJEFkLrvmg
 vhejVAcq2OeC2aghOVk/1Q4soys0sQGZPNlk09VIdfxItuwvPkWhDob2dhGAdF7j0hjNg2qPBydQX
 83/SarOFT+ojMCEcsxLOLw/4wSPuSH4O+auseuZdETjvV+Nxu3ul4JWjKRnvjqGN2Ed8=;
Received: from mail-tyzapc01on2093.outbound.protection.outlook.com
 ([40.107.117.93] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q8vQU-001N93-1M for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jun 2023 04:14:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Doax24JwnLJyvh4cltZNIiZr6a145H6qCIM8/13UNIbDlKhweICMVspKL5IQJCB2uO1P3icqelFpMH7ibsHn/sjXXO4bCShp8heyfroqGzPeaoJoInIRlkhDSBHsUGavpvzlfcEi2d002doSa6S9eBmZhtmJ5n/jkzJdhgUs9oAF5d4MyhDlM4pBzn3WlYguqtokjIRCE2p9shVrtLvY054BNI9+iwXf1zwMHyzDHd+5bftvQWJdROiUofM0ErXMpIY+0LKtLWWFl4y0DDOhd/70dFx9NhyD7ao8H0rDLhYdHJ+FAZeAZqb8VfF1eCaew5ZPgR5BtfnAqnjIdvIwNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5RdESJ6VupJCCNC7WtfoUgADXEL+mT0Ue8aSFRuO4YE=;
 b=b3Rr4tnGMNW0dLoCjPu0rAUg8D7EIp8iRVRlnUychlYmgpp2gkpNmV0WlxK2xtSwaK+wg3eL8he9MNP/TLshJA3S0skc517hJ3klkvlAJNfD1f5d/PDqKSiVCEjmmMrWVRpPpIbOVHiEjs9FTRPvywajUvV+OaPQU6tXHPC5SlepZn/NXdJU6LH3wo/x7UVxgz5Q2dqV9XIW4IZ00gmLrpIbz2vQgRxp183yltKQXTWm2LTVo//MF9oCFplUcXU/NWozGjRVnhaJDd0LxdXHz9jDeltZUj+BINh6XZqDKajkQsGT/iXlLMaL7xKAVURIEGruZREtsocDGo0C0IT2Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5RdESJ6VupJCCNC7WtfoUgADXEL+mT0Ue8aSFRuO4YE=;
 b=bKyBqyfwdJ0ZsePS3NNzzvfJuTXyAAptoNn07Ll8imqA2phRa0yvejoWOCmpwQzF6FoqCIVr/WqrK6GXDuNUDXIyKEyNWZYAbAh4hlNgZJQctyrYTJT3BMPhnsyJyVgXiBjNnuHeIsNOrvNJ3AsV/yykmpesRWW/iN22MAxLDlQzRfj51GQo1L95OSVvRKNbTDBlyUFM8VpxZqvhfGt+Q01R6/UJx+MZlALq7T69bSBnSSPen2sbKy/fwbInGqGONaaUcbuMf5+cac+EOQnaGYC/4qE2oqKDvAdsosGAdlyrr+Et6ZaCMUP6dvUM87CVfr04caAOWJ8iDVSdylOwSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB5038.apcprd06.prod.outlook.com (2603:1096:101:52::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.42; Tue, 13 Jun
 2023 04:14:27 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%3]) with mapi id 15.20.6455.039; Tue, 13 Jun 2023
 04:14:26 +0000
Message-ID: <dde6972a-e98c-8a6e-493b-9aff5668101d@vivo.com>
Date: Tue, 13 Jun 2023 12:14:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230609131555.56651-1-frank.li@vivo.com>
 <8097d4d9-815e-2527-0fb7-90ec0609a4a3@kernel.org>
In-Reply-To: <8097d4d9-815e-2527-0fb7-90ec0609a4a3@kernel.org>
X-ClientProxiedBy: SGXP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::31)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB5038:EE_
X-MS-Office365-Filtering-Correlation-Id: eaafd070-f958-4f79-99e2-08db6bc4ad15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C+d6DSkEYaHrRB76rhP7iFonc/B4mbalxyGOQIHoTfvRxNFJehy5UIt/EVjttzffQPQMB68FxR4zDtK3+CLOrplWBRJtNdKOmzOqHZNAHb/hkmuKOHjlNn3NZVFgnwwNQlBCCEWPQoU7x58e3+3p9V+moeXqjya+e/Y2URV50+KKzdwNABV2LheGFkeDqvKOzEdE8r0edM+jCqXFWyupawfYvrc+Bh8nXdHTuyBLoCgxI6eTN0SeB+Ju6nCx1tALA+GE+K9fqi9t5mM0GaJdKNC4nX0/3UkjNs/vbaKUHvpMdHfO3ImDYlapFTcqgtHQIrmGksz+Q/A7Va+lbtHomkJUNBecM1/Jxc0+U4fCxAxMrqxJLrTPCL3BgauD4dk1qiRCoB2xw1q4L2dF6mLG0PNFgSbr+HohVkaVP6Z/1JbyEG6hJHrH3cGCtkXUDp7hE4JqoQHBR5TYKPcraP6pAl940shZ9ZatsvISHgQXiZ2qxJtjCbiwZCWXSm+po68omRH5WtqYt/cA77DDvDpYVQG2Qt5IXFdPtFhwSF7wV3RAjepgszEE4sWQbgqV9nfWeQ6lhuZeQ8/1uOqO6geh5QAmQ8mdlB5q0GipanAy1PcxyPpNwIOChzZgTypfQdzktXetey1ApP5QSDsjsEks1243FCFFE+IRp0+5P/K8ECXgviPEWqiFRqFNShupq98C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199021)(53546011)(26005)(6506007)(6512007)(31696002)(86362001)(186003)(40140700001)(36756003)(83380400001)(2616005)(38350700002)(38100700002)(5660300002)(478600001)(316002)(110136005)(2906002)(41300700001)(31686004)(4326008)(8676002)(66556008)(66946007)(66476007)(8936002)(6666004)(52116002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3k0VUtCSVF5SnpSSEYrYVQ4WVVpSWIxKzI2ejVIUlB6QzJLSTRQTEdYdXlC?=
 =?utf-8?B?Ri82YmpjSzFDZ0NTcmo3eVRqVktSWHhJVUVocVZWcUJQWXdlRUl2MWhDMmZp?=
 =?utf-8?B?cmZWL0ZnZHhKM2x5MVRHZ1Y0VEVZSDNiSHpxNDU3NWFtc3ByZm01WDJoMnpz?=
 =?utf-8?B?TzhCQWk3SjRTUmpHK1pnbE9ici84alRjYUwreWllK0dBWEpyUXZkSUpOcUVB?=
 =?utf-8?B?dW5QV1lmc0JYdFNqY2VMU1BEWnBTNmo4ZXpmVUcreUJkNU5EUG91cC96NFlw?=
 =?utf-8?B?SllhM0F1STJjUUJXTExMbVpQaENjUFJPVThZQnMySlZEbXRVUWUyeDFwNnRU?=
 =?utf-8?B?b2FaYmZlN2hadlJndGpJTjkvNWQzR2h4cWZLUlF2OHRZdGhvbllXbUI4cHdh?=
 =?utf-8?B?SjlFY2U0NWJDVDVLMHYvVExsR2FOYnBDNlpjQXYrbldjQTBEU1Z3VWdaU0x3?=
 =?utf-8?B?L2dobzFQQWpkTlMyb1FhRWxrbGtnV1RhelhJVFBVNWNkaGRlUnlsNlQzMDla?=
 =?utf-8?B?SXhxSmNWNHNnT2E1Vk5RU3RIOG9rQk1JQUtIWkI3OE1iNmRaWEpReUtkWGUx?=
 =?utf-8?B?ZjNCakZVTzF4Yk43bFIzRUdsVWxCY3pvMEhwYTdEWlUrTXdLbm5reXQ2blNo?=
 =?utf-8?B?NmRYUEpTTjBuTjdVeTBtcE1kSGNnMlRTRUU1b1pDbUd4L0xWc1RxMjI2akpJ?=
 =?utf-8?B?R0lKWTFnQ0lOTXd1Zk43UWwza3U5dEhLUEhzSVUvamRUbTgva1BmYkE2cjZF?=
 =?utf-8?B?VHUzeFhtYlB2YjBJaVBxT0VPeDRORnpjTEIzeU4va1IxbTYxcFp2cEFuL2k2?=
 =?utf-8?B?elhiMUtEMERoeENqZzNlZ1FjOVRmSnBEbTJ3ZVE4Rk8wK24rOTF1ZVZTY21z?=
 =?utf-8?B?TS9Vd1NrMmY4MEw0UEtmM25aSkhRaTFvMEozS0hyWGdveWRjcFh6RWFIRk5X?=
 =?utf-8?B?dzh1TlY2cHFlY2NkNkN4OWp3bnBXMWZzZXQrU3c1YktwczRJUnBvSkwyWEdj?=
 =?utf-8?B?WjlsZjBpemVPZHAyRnVUNjJ0VCtDc0V3VGhwc2psbTlDTERlclpiUnkzL2Z3?=
 =?utf-8?B?ZFJ1c2NWZFV4clhYSTRzZmRZb2JVMDNFVlc1b3E3ak5XNFB4N256RXdZZGZ2?=
 =?utf-8?B?eXNpREppQzBqWEFQZUUxZk5uSGZMT0ZhZVZBQXV4bC9sYWp3TzdRcnd3bnBJ?=
 =?utf-8?B?VXdzcEJLZUg4UUZJUlljazVHWGl0LzV5UFBkTTlNeldPWGdpbWF6Sklab0RQ?=
 =?utf-8?B?aDVKdGE4b28xTGtJUUdQak5kM2paZlRpdm1mWmZGWFdvWnZNSHEvUWFYdkVI?=
 =?utf-8?B?R1M4bk1YaUR2cHRrY2YzZ2hSMGx0cHdwaCs1aFlMRisrR3hxWGdReHRBWTFm?=
 =?utf-8?B?eDQwdjVnSG1FMk5nemFnbkQzRFpNeE9MVUlMczY4eEtUOHo0ZWZuM2dkT09q?=
 =?utf-8?B?a1hGYkVTWkRlSnkyRkZJakY2VlI2U1loUWFLTTVQclV4Mk4weXloN083RlJ4?=
 =?utf-8?B?UnRDSUhTVTB1R1M2cTc3MXVMTUJ5WFRWZ1lVSnFZV1hOd1VQbnR4WjNvWW1z?=
 =?utf-8?B?Y2o1NVcvcFB1ZmtRUkMxS0ZVM3NOdHprM0VPSmNaS01vS3hYaGJnOCtrMVlR?=
 =?utf-8?B?MzZhOGdPSjR3Umh0Vm0yaG1Ma0huQWRZc3hTNDR4MmFpVU5YeGRVVWluNU1a?=
 =?utf-8?B?T3N3RGYwbzdyTmVZazE3dmExdll0emNONVpjR0YyQnJPOXkvdldQeDZwQnND?=
 =?utf-8?B?dnhraGN6WTA3Y2J6cXhtUG5hTXBwY1ByeDViKy9RMUthaXBzaTRzU1JINkd2?=
 =?utf-8?B?enpwS2xRMjA2d1Vqa2FMN1oybURxcnVkdG9YdC81SzZEdVhNemtlTWlJRmV2?=
 =?utf-8?B?eGtIb090Zm1mUkRxcTFxTU9Eb3NvM09qR1duazkwZXpiMndVRTdzN3Y4OTVt?=
 =?utf-8?B?OE5ralJyblJPQklKb1RPRTNaS3dlYTYvcGtHRDBydnVHemUwYWxqdXRuR1V3?=
 =?utf-8?B?MnZXNStIblJtMFNDWGdjOFNFSzFEWTZxTzVFQlZ2cUlHZ0tYZ25vWHRocWJj?=
 =?utf-8?B?MU1CVlF5RGNobXRuNHpjdUw0RkVQM3l6NGdPcUNTbFNoNFU3ZFBHczFhK2lN?=
 =?utf-8?Q?lblGTMAW/pigtdSlV5z9L3+3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaafd070-f958-4f79-99e2-08db6bc4ad15
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 04:14:26.7147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uETMpZMVtY4SqLlpQWqgzmLO1f+FLsvRDSsh8e3U1n3NeKLLJcnN8PPcnz1uu3WJomh2pF9+uCSlAcaouJxhxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5038
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/12 22:38, Chao Yu wrote: > On 2023/6/9 21:15,
 Yangtao
 Li wrote: >> It is observed that when in user compression mode >>
 (compress_extension=*), 
 >> even though the file is not compressed, the [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.93 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.93 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1q8vQU-001N93-1M
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: don't force buffered io when
 in COMPR_MODE_USER mode
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
Cc: Qi Han <hanqi@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Ck9uIDIwMjMvNi8xMiAyMjozOCwgQ2hhbyBZdSB3cm90ZToKPiBPbiAyMDIzLzYvOSAyMToxNSwg
WWFuZ3RhbyBMaSB3cm90ZToKPj4gSXQgaXMgb2JzZXJ2ZWQgdGhhdCB3aGVuIGluIHVzZXIgY29t
cHJlc3Npb24gbW9kZSAKPj4gKGNvbXByZXNzX2V4dGVuc2lvbj0qKSwKPj4gZXZlbiB0aG91Z2gg
dGhlIGZpbGUgaXMgbm90IGNvbXByZXNzZWQsIHRoZSBmaWxlIGlzIHN0aWxsIGZvcmNlZCB0byB1
c2UKPj4gYnVmZmVyIGlvLCB3aGljaCBtYWtlcyB0aGUgQW5kcm9CZW5jaCBzZXF1ZW50aWFsIHJl
YWQgYW5kIHdyaXRlIGRyb3AKPj4gc2lnbmlmaWNhbnRseS4gSW4gZmFjdCwgd2hlbiB0aGUgZmls
ZSBpcyBub3QgY29tcHJlc3NlZCwgd2UgZG9uJ3QgbmVlZAo+PiB0byBmb3JjZSBpdCB0byBidWZm
ZXIgaW8uCj4+Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCB3L28gcGF0
Y2ggfCB3LyBwYXRjaCB8Cj4+IHNlcSByZWFkwqAgKE1CL3MpIHwgMTMyMC4wNjjCoCB8IDM2OTYu
MTU0IHwKPj4gc2VxIHdyaXRlIChNQi9zKSB8IDYxNy45OTbCoMKgIHwgMjk3OC40NzggfAo+Pgo+
PiBGaXhlczogNGM4ZmY3MDk1YmVmICgiZjJmczogc3VwcG9ydCBkYXRhIGNvbXByZXNzaW9uIikK
Pj4gU2lnbmVkLW9mZi1ieTogUWkgSGFuIDxoYW5xaUB2aXZvLmNvbT4KPj4gU2lnbmVkLW9mZi1i
eTogWWFuZ3RhbyBMaSA8ZnJhbmsubGlAdml2by5jb20+Cj4+IC0tLQo+PiDCoCBmcy9mMmZzL2Yy
ZnMuaCB8IDE0ICsrKysrKysrKysrKysrCj4+IMKgIGZzL2YyZnMvZmlsZS5jIHzCoCAyICstCj4+
IMKgIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+
PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+PiBpbmRleCAx
ZWZjZmQ5ZTVhOTkuLjdmNTQ3MjUyNTMxMCAxMDA2NDQKPj4gLS0tIGEvZnMvZjJmcy9mMmZzLmgK
Pj4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPj4gQEAgLTMxNjgsNiArMzE2OCwyMCBAQCBzdGF0aWMg
aW5saW5lIGludCBmMmZzX2NvbXByZXNzZWRfZmlsZShzdHJ1Y3QgCj4+IGlub2RlICppbm9kZSkK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlzX2lub2RlX2ZsYWdfc2V0KGlub2RlLCBGSV9DT01QUkVT
U0VEX0ZJTEUpOwo+PiDCoCB9Cj4+IMKgICtzdGF0aWMgaW5saW5lIGJvb2wgZjJmc19pc19jb21w
cmVzc2VkX2ZpbGUoc3RydWN0IGlub2RlICppbm9kZSkKPj4gK3sKPj4gK8KgwqDCoCBpbnQgY29t
cHJlc3NfbW9kZSA9IEYyRlNfT1BUSU9OKEYyRlNfSV9TQihpbm9kZSkpLmNvbXByZXNzX21vZGU7
Cj4+ICsKPj4gK8KgwqDCoCBpZiAoY29tcHJlc3NfbW9kZSA9PSBDT01QUl9NT0RFX0ZTKQo+PiAr
wqDCoMKgwqDCoMKgwqAgcmV0dXJuIGYyZnNfY29tcHJlc3NlZF9maWxlKGlub2RlKTsKPj4gK8Kg
wqDCoCBlbHNlIGlmIChhdG9taWNfcmVhZCgmRjJGU19JKGlub2RlKS0+aV9jb21wcl9ibG9ja3Mp
IHx8Cj4KPiBTaG91bGQgY2hlY2sgZGlydHkgcGFnZSBhcyB3ZWxsPyBpX2NvbXByX2Jsb2NrcyBt
YXkgaW5jcmVhc2UgYWZ0ZXIKPiBkYXRhIHdyaXRlYmFjay4KPgpJSVVDLCBpbiBDT01QUl9NT0RF
X1VTRVIgbW9kZSwgaV9jb21wcl9ibG9ja3Mgd2lsbCBvbmx5IGJlIHVwZGF0ZWQgd2hlbiAKRklf
RU5BQkxFX0NPTVBSRVNTIGlzIGVuYWJsZWQuCgpJZiBGSV9FTkFCTEVfQ09NUFJFU1MgaXMgbm90
IGVuYWJsZWQsIGlfY29tcHJfYmxvY2tzIHdpbGwgbmV2ZXIgYmUgCnVwZGF0ZWQgYWZ0ZXIgZGF0
YSB3cml0ZWJhY2suCgpTbyB0aGVyZSBpcyBubyBuZWVkIHRvIGFkZGl0aW9uYWxseSBqdWRnZSB3
aGV0aGVyIHRoZXJlIGlzIGEgZGlydHkgcGFnZT8KCgpUaGFua3MsCgo+IFRoYW5rcywKPgo+PiAr
wqDCoMKgwqDCoMKgwqAgaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUsIEZJX0NPTVBSRVNTX1JFTEVB
U0VEKSB8fAo+PiArwqDCoMKgwqDCoMKgwqAgaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUsIEZJX0VO
QUJMRV9DT01QUkVTUykpCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gdHJ1ZTsKPj4gKwo+PiAr
wqDCoMKgIHJldHVybiBmYWxzZTsKPj4gK30KPj4gKwo+PiDCoCBzdGF0aWMgaW5saW5lIGJvb2wg
ZjJmc19uZWVkX2NvbXByZXNzX2RhdGEoc3RydWN0IGlub2RlICppbm9kZSkKPj4gwqAgewo+PiDC
oMKgwqDCoMKgIGludCBjb21wcmVzc19tb2RlID0gRjJGU19PUFRJT04oRjJGU19JX1NCKGlub2Rl
KSkuY29tcHJlc3NfbW9kZTsKPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJm
cy9maWxlLmMKPj4gaW5kZXggNzRlY2M5ZTIwNjE5Li4wNjk4MTI5YjIxNjUgMTAwNjQ0Cj4+IC0t
LSBhL2ZzL2YyZnMvZmlsZS5jCj4+ICsrKyBiL2ZzL2YyZnMvZmlsZS5jCj4+IEBAIC04MjEsNyAr
ODIxLDcgQEAgc3RhdGljIGJvb2wgZjJmc19mb3JjZV9idWZmZXJlZF9pbyhzdHJ1Y3QgaW5vZGUg
Cj4+ICppbm9kZSwgaW50IHJ3KQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHRydWU7Cj4+
IMKgwqDCoMKgwqAgaWYgKGZzdmVyaXR5X2FjdGl2ZShpbm9kZSkpCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCByZXR1cm4gdHJ1ZTsKPj4gLcKgwqDCoCBpZiAoZjJmc19jb21wcmVzc2VkX2ZpbGUoaW5v
ZGUpKQo+PiArwqDCoMKgIGlmIChmMmZzX2lzX2NvbXByZXNzZWRfZmlsZShpbm9kZSkpCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gdHJ1ZTsKPj4gwqAgwqDCoMKgwqDCoCAvKiBkaXNhbGxv
dyBkaXJlY3QgSU8gaWYgYW55IG9mIGRldmljZXMgaGFzIHVuYWxpZ25lZCBibGtzaXplICovCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAo=
