Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7130F838A1F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jan 2024 10:19:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rSCwC-0001C2-UW;
	Tue, 23 Jan 2024 09:19:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng1@oppo.com>) id 1rSCw7-0001Bw-Mr
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jan 2024 09:19:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y4Ob8M80hV/nTvLHm/Qpw2RTQO8ZUJNCbOpV749PqvA=; b=gVzBYEsUJOqYTvtRW7SBPa5VDV
 g6hecSE8zflt4rspdhuDTgPirYEdcR8iBHe0cqELqM/H2UJSg7LQxaBcsrMGs/AFFnEeZbwOJxIzG
 LdWR4DGJhBNU7JfTCCTizAO+CtbQCKjaVlyOXot6TLPc6MX0FQFVvmS34zm6p1nQ5bP4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y4Ob8M80hV/nTvLHm/Qpw2RTQO8ZUJNCbOpV749PqvA=; b=UpYwj/nJNYFCImV/brQGB288dc
 hQUhdweTDKtiYZTL641pF+MlyECtmbE+tFIRYN30fT4Bdu76plJlVLscdti+0lyyP8ntQixwzJ1MI
 n3elJLzL+ZjP4YMle+RoiVUMSMNWeG3i7v5zLXb8rxhrUIydswCBcc/EM6Ybd9Vt8sbo=;
Received: from mail-eastasiaazon11011004.outbound.protection.outlook.com
 ([52.101.128.4] helo=HK3PR03CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rSCw3-0006mZ-Bh for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jan 2024 09:19:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ivkVV8G/2goP8ahUUYswZrfQhitcTWitMkFE+27x6t74P4dcQY9f6WH3LA53FL5IDrvhefIRuETJhHpH03ZzAXnCrqBexGkr54KntIOQH0GxN49Z33YG4YxLbbJ3eYzvR/taAxM4c8LYqMADc/RrICDXoN0mhzJupuXCbPyXzpnpUhANngGxaQhZcTr9xfqWoI63+4npvhr40UBGeiYBkqwMgrcZoA5SM1Y9215zrF3zo9+7AM4H5ILUJkSzKuG4q3EsRlwPqjDJ26+/3JcDaLQisjwXqux++kjG8A2r2ky8K26t+AQLxfA8kudIqy8woArP8E0Z7YbnnlykgfzYoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4Ob8M80hV/nTvLHm/Qpw2RTQO8ZUJNCbOpV749PqvA=;
 b=PB6G+U5KY+TXgrk7He8OmeljW3SJOrDDxa1/IKes2BJDAlAs2mQuwSGEbLs5Zn82NQ76Qz1TfqAx76NJSNlFJBL+wLXAsdN+XyfSecmul9hr1kN2zxrmXv5fok72bq/lh/3YINh2ohSR5caXOSHoqwQVrVeHbl1bxNGeW/VanWEfvVaW8CHtFpEg+cvEOeAkSFM2Sro0lpJl/gAbJU9LWBip8ENTruI/cqlgECu2dCOtq6YCDu8WB27ggchYvRkI7cIMP5bywA7GCiFu4DhDULwMhtW269mGCUFCKMvFUFlMXAzPx+jEtxSL9uaWGwo1uoTHfNX5AWCsFgZJ9zFD+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4Ob8M80hV/nTvLHm/Qpw2RTQO8ZUJNCbOpV749PqvA=;
 b=OwIHl3ianVcy8+C9aIFgGFL70sAPEdElZlqsXXPzDAvut1gN2VhS/ht+JTTmvXjTzrbZKoYN6rsaNPzGaKMHX/IKQ+7lxfHfBm297QnABiM5uDL02+XHm7WuqzNSyIPO0f+w8GuYsvjlxIM1Yz+/nCUlLo19YTY2n+nPZHBP+W8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from PSAPR02MB4727.apcprd02.prod.outlook.com (2603:1096:301:90::7)
 by SEYPR02MB7251.apcprd02.prod.outlook.com (2603:1096:101:1d8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Tue, 23 Jan
 2024 09:19:02 +0000
Received: from PSAPR02MB4727.apcprd02.prod.outlook.com
 ([fe80::f4:dbf7:9c0c:5388]) by PSAPR02MB4727.apcprd02.prod.outlook.com
 ([fe80::f4:dbf7:9c0c:5388%4]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 09:19:01 +0000
Message-ID: <cedb4875-5795-4789-a010-a9c66fa61707@oppo.com>
Date: Tue, 23 Jan 2024 17:18:57 +0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Wenjie Qi <qwjhust@gmail.com>, jaegeuk@kernel.org, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <20240123081258.700-1-qwjhust@gmail.com>
In-Reply-To: <20240123081258.700-1-qwjhust@gmail.com>
X-ClientProxiedBy: SG2PR02CA0066.apcprd02.prod.outlook.com
 (2603:1096:4:54::30) To PSAPR02MB4727.apcprd02.prod.outlook.com
 (2603:1096:301:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR02MB4727:EE_|SEYPR02MB7251:EE_
X-MS-Office365-Filtering-Correlation-Id: c93db9fb-53f2-4e21-6c8b-08dc1bf45669
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /pRgDe0ZoPsWk1i1ESvAaehPBhE1CyIUYvSVL42+VWjDcfEfOZcKxyhIrBZtRuqfghgbgm7fZUxrayq6nflpmrSKZnzUKfwBZgEiPZzbKaY5+jevxvHdKLADzdPr1MZZOQn3wyb1DQSd/wa98L587U+9uufEyBWQQZcLUmRpQv3P4PryJE13XqQP9Rjc3pEK4BBRJZ0kmKvWAy+30l+MjZOC2LXbAr6WaTe5TxaGAlVmS6ixCtYfeFv780SMMLnKRR9wRRz73UEu/Z1h0taSHl4eFgyLT7KROdyZBJyVMY8jeRS1+dN9zHH4INkJXAa67wzwVpvRQJxfDtZ7jtwLSJavrxWg/UXP7reSKTVrettA5+aCTGGfuT6fpCapbE2NsM/fSGSjPvOvwpv2q6VsJNoqXFiV9MDw1Nvwui/K4BNY8yoGPVOp8Mkf3LUecWnhnY6+jU63pGJuWjg1Cp9pv/0Ic+vV1/F8NRQR//DfIFV942ESlH6VdBOXXep59PfXw4LpSccZaJPRJBbFAgAGdY9Mha3fPRY3RGjYLU836va9F1BOQc3x296DPMpToPjeFxJsEDOSQ9txFqw8GoZBF5cTze1w5ozukoQwO0+mvS9J9/Dv1EsjnUEOqxwtyDLhGwS0QMchtjOEItSPZ9F9yw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR02MB4727.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(346002)(39860400002)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(31686004)(83380400001)(41300700001)(36756003)(86362001)(31696002)(2616005)(26005)(6512007)(38100700002)(6486002)(6506007)(2906002)(478600001)(66946007)(316002)(53546011)(66556008)(6666004)(66476007)(8676002)(4326008)(5660300002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0w4dWppY1IrNDdIeHdNdzVnazd1c2VrbWtIZDBvLzh3VXpmdThhdXA3cXdm?=
 =?utf-8?B?VVdEV1gzd0dmelpGbFFNQVR3NkMvU3JPR1VQYU51bWNoaFFVQTd1dURQUDlR?=
 =?utf-8?B?bzByaEVDZ203bStxckFFb1VNaVYreFRsQ1d3ajlPdldyWFRPd2xiZllIMWFP?=
 =?utf-8?B?ZUZVTEwxKzNzRUdVczdNdGpmWUVsMFVDdlNOWmdpUENlamp6cnlxcXgrQXRZ?=
 =?utf-8?B?SVlZUXVvcGxDWXBVM3R1UEY1d1VTK0YzcXZxZkVjSUFkOC9CVEtpUXFGRmpl?=
 =?utf-8?B?VWJrckhTa2dSSklGS3J5bkd5M1hXU1JBTXIzT3lTZG5hMXpvWDdkV2hWc3Vn?=
 =?utf-8?B?SnlEN1puUlhKVzJ1VEQvN1hLbmpvT1ltbVZ3T0EzSlU1S1hNSnNuNjNMdFVX?=
 =?utf-8?B?QktNbkZpM3NXUU1heGVEeHF6YVFrSkQwd1hKVGZXQktOU3dNRi9GR2hBVGlP?=
 =?utf-8?B?VXpzSDk4L290R1AzYlR6NWN3MFFpK1I3NmJSSW13WWVIWmRzbUd1eXdkOG44?=
 =?utf-8?B?dU0yOE1XaXh3T3VjQ3dOMzhIZjRLcjBHWmcrQW41UGRCc3NDMVp3Yi9jWllK?=
 =?utf-8?B?Smx5RUpLSEkxdE1yeVJkVUJjb2RpSDBNQUhQRndpT2tvVHIybDVXd3ZiUWJt?=
 =?utf-8?B?MHNRL1FrYy9MSHhudUF6TjNFK0JNallCb3dGMDNOTW9KcmtUUDFjQTlIa2tO?=
 =?utf-8?B?TDhUUGo2UTc1ZHRvaEhZYmFwd2t5VHNRcHJvdzQ3aHE1WEpUVmxQeGlxdzZi?=
 =?utf-8?B?d280TE1TRzF3RkhhZkV4OU1xYysyMmM4eEVQVURwRVRnSWVJWllWMFk3TDdr?=
 =?utf-8?B?RTd5TnNUcVZqRzUvcHU1TW51Snl6U3dXcEJKS1ZYWFVFQm55aHRpUjRobnR1?=
 =?utf-8?B?VmpmUXBjZ0RNNzNTSUorK2dCR1NhNWFRZkZnSjgvNk1GeFpkNGZwSzNUTWdi?=
 =?utf-8?B?VzYxODl0Wi82RXFlMmw2NVpUcjQ3TnZtNGppVlU4ckxoeXJxWW5XWnpTOEt6?=
 =?utf-8?B?T292Q0RUcWh4RG90L3VONVU3bnBGbUgrNXYrZTV5TGdHZklYb3VSVkNFbktC?=
 =?utf-8?B?THUrMktrTG5od3VFMzk0aER1bC9oQXp3TTlHanJXcG1mNzhZbHF6ZjQzK2ky?=
 =?utf-8?B?RjJIVkdFQWhNT2pIN1hwK0VndElBa1dJa2dJbGxyckdaS05JaVhydEV2WkRZ?=
 =?utf-8?B?T0hGZDB4a2dQSmVRclZRMnArRzhIeVFqSWl3VG1HaWVraUVhMlpsZDhYemsv?=
 =?utf-8?B?OFVLK3JnM1pxYURVM09KUThzR3JTNkFiQzA4QmJoUjdRSWZXMjB2QXhtSVdj?=
 =?utf-8?B?NGNIbW1XK1ZFS1ZCS2poTVpkd2dzZEw1NTNTS3d4K2NBNmNXa283WHF0TVBa?=
 =?utf-8?B?bW9zWmFWZVEwbjRqUzFaSzlLa01sR01qUmY2ZlpudjRaUS9JR2VDRmpuZ01Z?=
 =?utf-8?B?ZndzcFhQUTRra1NvWjBYbVptcll0ZVlDQW11Z0VsM3dOWUQ4M2N0MVlpTkgx?=
 =?utf-8?B?eTJvUWlUNmd1V2F3Znc2enJvYXFIdTVLVlpUZEV6TWE1eSsvMnZiVTAyWGJY?=
 =?utf-8?B?M2YxQnV0alU3QUozNnQ4UDFPL2pxQTNHbk5qT3QrRGt4VE1RM083cnJDOWF2?=
 =?utf-8?B?Ni9qL2NkUDJlTThjRkw3dGpaMitKcmtmQmFVb1p1Sm1CRW9IeHRjbnFBNCtS?=
 =?utf-8?B?SW5yRm1TalRwRDhtaGV6a1BPRThsWGlZaUlCbndrTXJpTlc2NkUvOTllWU9R?=
 =?utf-8?B?aEI2OHR2Y3ZROVUwTDlTTFFtbDJmU1BpU2xsb3dlalo1c0ZBUVZkQkpwS1ZS?=
 =?utf-8?B?OXlEcERTdHlSWmlSMkN1WGNRdDByNWEzdzQwZnZCSXdQQ2NYQTg1blgvU2Zj?=
 =?utf-8?B?ZEFhdXpFa2xiWlp6SVhmTEluZ29QVTJnRkhwYnFTUDU3d2psMktteEhkZFhx?=
 =?utf-8?B?MFhUamdHcEhsUUlFSFE1SDRLeG1nU3NjbVU4WGF1VnBNV3o1N1AvdlBuYnBv?=
 =?utf-8?B?clF2aU81ZThWQnRiUEMwaUQ1SytGZXFOVTk5akp4cHhpTjNrb041aVR6aU92?=
 =?utf-8?B?Wmt0ekdVSWF3TzlDMHQvajEyQ011ZFR2bnFaRDFOMzIrRXR2eTNPUnJwVWRD?=
 =?utf-8?B?VStoUzlTeGJWMFQ2NnhrdVV2S1VYUVhwMFdodXJ6blZaM1R3azNaekFhWUVr?=
 =?utf-8?B?UXc9PQ==?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c93db9fb-53f2-4e21-6c8b-08dc1bf45669
X-MS-Exchange-CrossTenant-AuthSource: PSAPR02MB4727.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 09:19:01.7411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GYzQC353ijeV4yxKuVM9elvitkXk7dsdLEO4vAXFzP6wwKnY126Zui0cmSoybTkVM9vxdJyPZEmYxYSd/3lRWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR02MB7251
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Wenjie,
 It seems more reasonable to use bdev_max_open_zones
 instead of bdev_max_active_zones. If an NVMe device has multiple namespaces,
 and the device contains a total of 11 open zones, two of the namespaces,
 nvme0n1 and nvme0n2, each correspond to an instance of the F2FS filesystem,
 and both [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.128.4 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [52.101.128.4 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rSCw3-0006mZ-Bh
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix zoned block device information
 initialization
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
From: Yongpeng Yang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yongpeng Yang <yangyongpeng1@oppo.com>
Cc: hustqwj@hust.edu.cn
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Wenjie,
It seems more reasonable to use bdev_max_open_zones instead of 
bdev_max_active_zones.

If an NVMe device has multiple namespaces, and the device contains a 
total of 11 open zones, two of the namespaces, nvme0n1 and nvme0n2, each 
correspond to an instance of the F2FS filesystem, and both filesystem 
instances can be initialized successfully. Since multiple namespaces 
share all open zones, the number of open zones is not equal to the 
number of open zones available to F2FS in a multi-namespace scenario. 
This patch does not yet cover this scenario.

On 1/23/2024 4:12 PM, Wenjie Qi wrote:
> If the max active zones of zoned devices are less than
> the active logs of F2FS, the device may error due to
> insufficient zone resources when multiple active logs are
> being written at the same time. If this value is 0, there is no limit.
> 
> Signed-off-by: Wenjie Qi <qwjhust@gmail.com>
> ---
>   fs/f2fs/f2fs.h  |  1 +
>   fs/f2fs/super.c | 18 ++++++++++++++++++
>   2 files changed, 19 insertions(+)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 65294e3b0bef..669f84f6b0e5 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1551,6 +1551,7 @@ struct f2fs_sb_info {
>   
>   #ifdef CONFIG_BLK_DEV_ZONED
>   	unsigned int blocks_per_blkz;		/* F2FS blocks per zone */
> +	unsigned int max_active_zones;		/* max zone resources of the zoned device */
>   #endif
>   
>   	/* for node-related operations */
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 206d03c82d96..aef41b54098c 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2385,6 +2385,16 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>   	if (err)
>   		goto restore_opts;
>   
> +#ifdef CONFIG_BLK_DEV_ZONED
> +	if (sbi->max_active_zones && sbi->max_active_zones < F2FS_OPTION(sbi).active_logs) {
> +		f2fs_err(sbi,
> +			"zoned: max active zones %u is too small, need at least %u active zones",
> +				 sbi->max_active_zones, F2FS_OPTION(sbi).active_logs);
> +		err = -EINVAL;
> +		goto restore_opts;
> +	}
> +#endif
> +
>   	/* flush outstanding errors before changing fs state */
>   	flush_work(&sbi->s_error_work);
>   
> @@ -3932,6 +3942,14 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
>   	if (!f2fs_sb_has_blkzoned(sbi))
>   		return 0;
>   
> +	sbi->max_active_zones = bdev_max_active_zones(bdev);
> +	if (sbi->max_active_zones && sbi->max_active_zones < F2FS_OPTION(sbi).active_logs) {
> +		f2fs_err(sbi,
> +			"zoned: max active zones %u is too small, need at least %u active zones",
> +				 sbi->max_active_zones, F2FS_OPTION(sbi).active_logs);
> +		return -EINVAL;
> +	}
> +
>   	zone_sectors = bdev_zone_sectors(bdev);
>   	if (!is_power_of_2(zone_sectors)) {
>   		f2fs_err(sbi, "F2FS does not support non power of 2 zone sizes\n");


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
