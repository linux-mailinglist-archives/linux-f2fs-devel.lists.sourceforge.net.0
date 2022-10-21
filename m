Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E225460829E
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 22 Oct 2022 02:04:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1om209-0003PJ-Pk;
	Sat, 22 Oct 2022 00:04:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Luben.Tuikov@amd.com>) id 1om208-0003PD-4M
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 22 Oct 2022 00:04:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hPT+gWJ3KCHw4Umqffy2WWdonR4AwcF1DE2qSsnIkDY=; b=Jk733tl/sOsUINarA1aG0GQWWw
 nen38lJ8kxt9fLfYhVcxtkOfRnX3EhMm0uw+VUj/eg0yWPrjPk+IvTqvV+ER6aSZqHV4IUdK1y/Ff
 pmmpjwaJ3cQVBjzP3tJcQoNNI/1WHPme99fd0HTokVtCdeWTYgbnZkfgwuCvpwtnjOGI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hPT+gWJ3KCHw4Umqffy2WWdonR4AwcF1DE2qSsnIkDY=; b=HU3E5e2oHmZ1xpl3yJ8+tyxAai
 UjodzKbUsNtk1aSk/oa+MMTVSTxpPteZNawn4g9XxLvibHdDxaYbD5yRzOkzE9nXycrjuf9JhISD/
 maIeYa/m6IixlBpgKo3WPIbcp/dvUUHNWMUrRs4fgN37xhNDxkueFHlqGoY3JsssKcR8=;
Received: from mail-dm6nam10on2043.outbound.protection.outlook.com
 ([40.107.93.43] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1om1zv-0004Ew-Kw for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 22 Oct 2022 00:04:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZbxxYzbj4iBWml1cmNJyvTiy2ed+DBTiWEQWfSGnj7IHD/hLcBlK1ksKY+4KFKKerDy6yeBzt1iQD8EpUeos9XWOERyP6xpRYrpFUMDI4g0JscPe8iZ19crnnEReRmDVbI3nQGjxfTdbOJybGX8IbaUENvBnHrndx//6QowRs31ozmFmvicUwWZ3y4rqzkPWKZWsr//4j40QZm9aOocPG5BWjGh8hFOO8XqUCO3bC2d2JOTuK0SPssfYgXsR4W43ySmjKxr2SIo8seNBBcZ/mwiT8A/4KotNpyGQ9IeD96eGry/dtM7ChKDWuehvZadWyWe0gh4PH57vLWWhvVFiKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPT+gWJ3KCHw4Umqffy2WWdonR4AwcF1DE2qSsnIkDY=;
 b=KsZNpGLswcYpHjntGCmR+FBiNBAJgvj1g/fUkaKHVp8JEGqZVmqXeWj3sJLwUg4aMv+VF8cEJ1NjxY1FaG13MR7pof0Mg1siu8qdy2y9dlathg2mAJLP7YJBvZBwcTqFtLMi3KRsurz+OEH7btfmXHuVLW/xuMp2Miz4PLyWDjt+HwJGBFFDi+rsbWOuywPkaqTwHyJwAlGlk9ADKcfduRa6DsxLQIsw0ZHsBoNLWyTQnej32XkNTXBAoX3kni2phcdOn8kBQcdr/gYSCygBeBxsoNLRpAxB5vP5RSZNX0gs/pdqZcN8m4CWOhNTYG/5rJDVM8FiZyZ6LpRy1oM2Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPT+gWJ3KCHw4Umqffy2WWdonR4AwcF1DE2qSsnIkDY=;
 b=cgSiwDMdkGO9pYYq3PEC8gzldMPy5uUCZDbIzq2xCXNJhWz0ugg4aqKpEmED0wC9lk7fMBeL6O/mAxxTzLcUl/g5KlwTt5k0B8pl98WgiKAWuiILpV28n5RtA/Unc7k8WDIc5zJd34sqXRA4phPiRuyL0SU9aNUPkGb4JAwOMn4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 CH0PR12MB5075.namprd12.prod.outlook.com (2603:10b6:610:e2::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.35; Fri, 21 Oct 2022 23:48:35 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425%7]) with mapi id 15.20.5723.035; Fri, 21 Oct 2022
 23:48:35 +0000
Message-ID: <3a068724-8fb3-920e-a529-9a232b6830a9@amd.com>
Date: Fri, 21 Oct 2022 19:48:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-CA
To: Yang Yingliang <yangyingliang@huawei.com>,
 Greg KH <gregkh@linuxfoundation.org>
References: <20221021022102.2231464-1-yangyingliang@huawei.com>
 <d559793a-0ce4-3384-e74e-19855aa31f31@amd.com> <Y1IwLOUGayjT9p6d@kroah.com>
 <0591e66f-731a-5f81-fc9d-3a6d80516c65@huawei.com>
 <Y1JZ9IUPL6jZIQ8E@kroah.com>
 <1f3aa2ac-fba6-dc7a-d01d-7dd5331c8dc5@huawei.com>
In-Reply-To: <1f3aa2ac-fba6-dc7a-d01d-7dd5331c8dc5@huawei.com>
X-ClientProxiedBy: YT2PR01CA0018.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::23) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|CH0PR12MB5075:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d5ce8e3-f289-45b3-cd42-08dab3bec48f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sXe3UHoS1sNO/at/vFqnPnaMxoDW/6R4DFzmSexR5iIlSmQFdACrzZZG+TvCrmzSHd5HFzKM0xwSAAF5wLmWo9JYAiMgledc7g1Y2fidUE8ccSsKYdiepEd4f+Dsw6uElglxFrGUSSHUgI6qLclAQ7A+icUwoUrTb0HDRIFJ1uSlwnxNqufVhQFD3Ry5i6WSz+j5xe5Kqs5u0//kRRVew0m3JCO/kRgcfBaz6DCFPQNks1M7gbn1qAZqnSP4Nl22HYwKTJWHhODgJr/+7nblnuEPhpfx184XeJwEgBvyYN5QMBvJyftWujuXILLjCjb15WOJw6MnjL/mjofDxpdbWmj3Vybs+UpzOxQTuzrsFhvMQQTdrTYQ1XVuIICav7Ikly7ppsLAuEjgLTy8B+VBpgijtl2muz3PaWGgJIoA6VctQ9AKVrLGNN/+1ueOGEQXEHL9OOdfVAI1WKyqRWLJ0MsVVCHUv8T4dL0x45EUU+Pr9eVEbzgI3NkqVTAp5H6FMhYbFOM9w8yNePuDgEzm5m9rj3PnYCpxxV8/5rWj5D45dzL+3E8u8+GfGHx2QRdKUfAtbY5bTBXuC2g0i34A9bLhkSpNtnNyTnAY7AW3+8fP1uLIlFDJVtuCJPqwgQxsQI8nruEYm0sdOV1rix6rbRGocvdJjfWfjJ0biuDvLobqa87qfXAOC9Furja1JgCheMvld+FP70I/0D1uyIEXi6D2O5K8oQcmqQ4UsL6Ej8lHxg0ZgZgUqUum7rez7OKpW2ndu8ud2xXZopkozraKPZHQEPvJcwh3TTmTROqtdbWIUY/AOM6Rwvm7WVSOmE1nzNyKFKnTPoJsp4WKbfcAog==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(451199015)(36756003)(66476007)(4326008)(31696002)(41300700001)(6512007)(53546011)(8676002)(26005)(66556008)(7416002)(5660300002)(86362001)(66946007)(45080400002)(8936002)(966005)(6506007)(44832011)(478600001)(6666004)(6486002)(110136005)(316002)(38100700002)(2616005)(186003)(4001150100001)(31686004)(2906002)(66899015)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUJjUmYwaC9UMjdwNHo0YTFsejUzRWJvL0poSEUzVEZ3VzdYZU9kQkxkMDRn?=
 =?utf-8?B?ZEhjVGRUOHhEK2xLQ3p1a2k2aGkzdU5HbkxmbGhQakZDNHQrc01YN04yWEsw?=
 =?utf-8?B?VnJzalNmM0hCSlU1dXppOGh3MHpFT2tEeTF3NW9tdmo3NUNyWllLOFRKeGdj?=
 =?utf-8?B?MFBRbEYrVjZPTTRDRmdmUWVRbjlhM3hMc1p3N09GWWgzTVNRR1JtanJpTjlw?=
 =?utf-8?B?d29wdFJhZ0lhVmRJNjdBdHBZeUhNZ0t6MVRSMk5DWDRoajd0dGR6bDFWOS9s?=
 =?utf-8?B?LzZUNmh5TlZrNWZCU2lPaEFlNi9meDJzNjVpOHllRDRnQ3BaeC96YWRvbVhw?=
 =?utf-8?B?S0UxNnpISUk2VHhCN0xIUFhTVTk2L0FNY0hXSkZRbHNQRWsrZDhOaGtJUXlk?=
 =?utf-8?B?elYrWVZaMStrN0oybGdhL2lvMm1BSWd2NVlZOTl4OG5aejhvVnI5SGdKMThr?=
 =?utf-8?B?eEY3aDNWVHdmSThPRkY1eHVKOHdQVGVzNWIzVlZOMFFwR2pOYWJSRks4eWJi?=
 =?utf-8?B?Q3BldnBZSmNQajFCWkJ0aDlBM3NGdlNQWWFWMFBSdk45cHZVL2NTQUJVTi9M?=
 =?utf-8?B?MW9KL0NYck9pL3JKUXFOZjlMMUhhN1dUZDFSd2lqVmEyU1FVMzZIenp3REw2?=
 =?utf-8?B?T1pVaXdlcDBYdVNhRnpXNUpCdUdTMmZ4SFZZMk9URmFUVitTbGhwM0duTnVl?=
 =?utf-8?B?ZXNjQkhmRDVKNExqcVNMUXBDcUdmNGZuaVlrdkpTeFFyaXp1Rk5PbGMwREdB?=
 =?utf-8?B?SXlMYzBSOVh3ZVRObHlwNzJtaENHR1d4NlpBYnc4bDdvRGgyRWIwZWpPWk5B?=
 =?utf-8?B?Zkc3elJLRDBrTkNKekVab1hDNWlZVGNLRitZVHBnYmNCdHc2T0ZBTExwVDlM?=
 =?utf-8?B?QmFOOTBmUjk5S29jMHhwd0dudGhKV0ZkRkhCWGlqQnliNXREN1lLK3phejFN?=
 =?utf-8?B?Vjc2Vk1ZUWM0WTdER3VpVTRQVXZQTG96b3dJVEh4bTh5ejZ5eTEvWkcyZ1RL?=
 =?utf-8?B?ZG1tdWVPN2JFWVZYOWFDSzZ1emhnNFRpdTJVTlM5eHdjK3FXa3RoVHdtVURi?=
 =?utf-8?B?R0UxZXBLR0FmcU1LK0tGRHVmd2M1bVM2dys4bStTMDZ4NFM0QlBQRnVVMzZG?=
 =?utf-8?B?YUNpblNpbE5HcU5JcGtxR0JmRC8vVnFScXN2b1dJRHNXNUc1RzhkUm9aYWtY?=
 =?utf-8?B?TVF0MHRjTVM1ZTJRbkRDaTYrSThMZm4wOStmQjI2ZFVzTlREbnZhbEU2Nnpt?=
 =?utf-8?B?ekxucVovbHozZVhUdjVCWGJXWU56OXpZVklqMnM5cnBGbkpKaTNhV0JjQWMx?=
 =?utf-8?B?bUUvRWxjYVdsTHFHR1RRYVR1WWVoR3NiaXk3QW1GYkRYSjJkRjJlT2tuTmh4?=
 =?utf-8?B?MWRIRUprUlZGOVRkMXpXNGMvY3licy9ISXlZdS81V3RsbVo5eHJnemx6UXpK?=
 =?utf-8?B?MVI5dE9OS2ZwUEhxc0J2dENFZ1hJLzhhZFJhVmV3eXYvYmU0ZnRYd0Q3TDBi?=
 =?utf-8?B?OG5USC9lclpsMVVvdUdXVlZYTFl1b1YyNnZLN1paS0NZT1l2ODdWQlJlcDlS?=
 =?utf-8?B?QlI3VWowRlZIUzk0YmtDUHFuSHZVblJWR3V0K0xHcnF5VzBvTnVQSldaelZu?=
 =?utf-8?B?RmNnajZSMzlva0pHVm44UEpYSWpzcnBtWU1ENnBGb1Nmd29BVWlad0g4Y2VC?=
 =?utf-8?B?eUpLUHBFWkt2UG03UjR2akJQVC9lT3Y1NWw5VTVlU2NCUFEveXRKbkFUcktR?=
 =?utf-8?B?Ym95U1VBUzJnYzMxaEc3b3hLdHh0WDdoYUIydnE4ODlpVmdJS0RUb1huL2dX?=
 =?utf-8?B?QjVJR3M2dFJMWWV6YS9rMTRxR1VrQnQ3OEE4dWhFRXNDUjk3LzlZWTI4MEhP?=
 =?utf-8?B?V3NyTFJnYnRxMWNwbmVuS3pHQ3VPcmhTOENQZXZOUUVGVmVwTHBYcWt2blVB?=
 =?utf-8?B?MDNaRGNFU1JxWEpZYTY1UWlTcG5jWDJ2WDhSRVhVUHhQWjhrR3pSR281VEI2?=
 =?utf-8?B?SS9nalBETUx4ZHdnRTBsbGJGRUh2aXFzMVBtOW16aGNRSkx3S1pHR3puMDdX?=
 =?utf-8?B?UFdHTTFDZVd5L3d4OXZXUVBObE1NNWZrODlpUUpaQUdpR0NMV3hWZEdVdDZ3?=
 =?utf-8?Q?070NBE4PkkWKbQB3jHPo7pNAh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d5ce8e3-f289-45b3-cd42-08dab3bec48f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 23:48:35.0356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5guKvYv7nE6SpmZugR0KPfIUxlvHAtSD1kV2E8jSSEfFB+VJZJWlbm09NsfLoWh+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5075
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022-10-21 05:12, Yang Yingliang wrote: > > On 2022/10/21
 16:36, Greg KH wrote: >> On Fri, Oct 21, 2022 at 04:24:23PM +0800,
 Yang Yingliang
 wrote: >>> On 2022/10/21 13:37, Greg KH wrote: >>>> On Fr [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.93.43 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: amd.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.93.43 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1om1zv-0004Ew-Kw
Subject: Re: [f2fs-dev] [PATCH 00/11] fix memory leak while kset_register()
 fails
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
From: Luben Tuikov via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Luben Tuikov <luben.tuikov@amd.com>
Cc: rafael@kernel.org, qemu-devel@nongnu.org, richard@nod.at, somlo@cmu.edu,
 mst@redhat.com, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-f2fs-devel@lists.sourceforge.net, liushixin2@huawei.com,
 joseph.qi@linux.alibaba.com, linux-mtd@lists.infradead.org, jlbec@evilplan.org,
 hsiangkao@linux.alibaba.com, alexander.deucher@amd.com, jaegeuk@kernel.org,
 akpm@linux-foundation.org, linux-erofs@lists.ozlabs.org, mark@fasheh.com,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMi0xMC0yMSAwNToxMiwgWWFuZyBZaW5nbGlhbmcgd3JvdGU6Cj4gCj4gT24gMjAyMi8x
MC8yMSAxNjozNiwgR3JlZyBLSCB3cm90ZToKPj4gT24gRnJpLCBPY3QgMjEsIDIwMjIgYXQgMDQ6
MjQ6MjNQTSArMDgwMCwgWWFuZyBZaW5nbGlhbmcgd3JvdGU6Cj4+PiBPbiAyMDIyLzEwLzIxIDEz
OjM3LCBHcmVnIEtIIHdyb3RlOgo+Pj4+IE9uIEZyaSwgT2N0IDIxLCAyMDIyIGF0IDAxOjI5OjMx
QU0gLTA0MDAsIEx1YmVuIFR1aWtvdiB3cm90ZToKPj4+Pj4gT24gMjAyMi0xMC0yMCAyMjoyMCwg
WWFuZyBZaW5nbGlhbmcgd3JvdGU6Cj4+Pj4+PiBUaGUgcHJldmlvdXMgZGlzY3Vzc2lvbiBsaW5r
Ogo+Pj4+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/
dXJsPWh0dHBzJTNBJTJGJTJGbG9yZS5rZXJuZWwub3JnJTJGbGttbCUyRjBkYjQ4NmViLTY5Mjct
OTI3ZS0zNjI5LTk1OGY4ZjIxMTE5NCU0MGh1YXdlaS5jb20lMkZUJTJGJmFtcDtkYXRhPTA1JTdD
MDElN0NsdWJlbi50dWlrb3YlNDBhbWQuY29tJTdDMjZlZDdkYzgwNTNmNDc5M2Q1NGQwOGRhYjM0
NDczMWUlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM4MDE5
NDAzODE5NzYxMzQ4JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFp
TENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzMwMDAlN0Ml
N0MlN0MmYW1wO3NkYXRhPVBEOTNFQyUyRmNCbWtmU0JiZG1LOEZOdFhocVMlMkZLbW1jQnlma3g1
bHFRZnBZJTNEJmFtcDtyZXNlcnZlZD0wCj4+Pj4+IFRoZSB2ZXJ5IGZpcnN0IGRpc2N1c3Npb24g
b24gdGhpcyB3YXMgaGVyZToKPj4+Pj4KPj4+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJv
dGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGd3d3LnNwaW5pY3MubmV0JTJG
bGlzdHMlMkZkcmktZGV2ZWwlMkZtc2czNjgwNzcuaHRtbCZhbXA7ZGF0YT0wNSU3QzAxJTdDbHVi
ZW4udHVpa292JTQwYW1kLmNvbSU3QzI2ZWQ3ZGM4MDUzZjQ3OTNkNTRkMDhkYWIzNDQ3MzFlJTdD
M2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzODAxOTQwMzgxOTc2
MTM0OCU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9p
VjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MzMDAwJTdDJTdDJTdDJmFt
cDtzZGF0YT1rMGZUU21BUFRuTEZDZTR6TjR6JTJGWTFaN0N2d080Z1IydmdqJTJGTEglMkZTUlJr
JTNEJmFtcDtyZXNlcnZlZD0wCj4+Pj4+Cj4+Pj4+IFBsZWFzZSB1c2UgdGhpcyBsaW5rLCBhbmQg
bm90IHRoZSB0aGF0IG9uZSB1cCB0aGVyZSB5b3Ugd2hpY2ggcXVvdGVkIGFib3ZlLAo+Pj4+PiBh
bmQgd2hvc2UgY29tbWl0IGRlc2NyaXB0aW9uIGlzIHRha2VuIHZlcmJhdGltIGZyb20gdGhlIHRo
aXMgbGluay4KPj4+Pj4KPj4+Pj4+IGtzZXRfcmVnaXN0ZXIoKSBpcyBjdXJyZW50bHkgdXNlZCBp
biBzb21lIHBsYWNlcyB3aXRob3V0IGNhbGxpbmcKPj4+Pj4+IGtzZXRfcHV0KCkgaW4gZXJyb3Ig
cGF0aCwgYmVjYXVzZSB0aGUgY2FsbGVycyB0aGluayBpdCBzaG91bGQgYmUKPj4+Pj4+IGtzZXQg
aW50ZXJuYWwgdGhpbmcgdG8gZG8sIGJ1dCB0aGUgZHJpdmVyIGNvcmUgY2FuIG5vdCBrbm93IHdo
YXQKPj4+Pj4+IGNhbGxlciBkb2luZyB3aXRoIHRoYXQgbWVtb3J5IGF0IHRpbWVzLiBUaGUgbWVt
b3J5IGNvdWxkIGJlIGZyZWVkCj4+Pj4+PiBib3RoIGluIGtzZXRfcHV0KCkgYW5kIGVycm9yIHBh
dGggb2YgY2FsbGVyLCBpZiBpdCBpcyBjYWxsZWQgaW4KPj4+Pj4+IGtzZXRfcmVnaXN0ZXIoKS4K
Pj4+Pj4gQXMgSSBleHBsYWluZWQgaW4gdGhlIGxpbmsgYWJvdmUsIHRoZSByZWFzb24gdGhlcmUn
cwo+Pj4+PiBhIG1lbW9yeSBsZWFrIGlzIHRoYXQgb25lIGNhbm5vdCBjYWxsIGtzZXRfcmVnaXN0
ZXIoKSB3aXRob3V0Cj4+Pj4+IHRoZSBrc2V0LT5rb2JqLm5hbWUgYmVpbmcgc2V0LS1rb2JqX2Fk
ZF9pbnRlcm5hbCgpIHJldHVybnMgLUVJTlZBTCwKPj4+Pj4gaW4gdGhpcyBjYXNlLCBpLmUuIGtz
ZXRfcmVnaXN0ZXIoKSBmYWlscyB3aXRoIC1FSU5WQUwuCj4+Pj4+Cj4+Pj4+IFRodXMsIHRoZSBt
b3N0IGNvbW1vbiB1c2FnZSBpcyBzb21ldGhpbmcgbGlrZSB0aGlzOgo+Pj4+Pgo+Pj4+PiAJa29i
al9zZXRfbmFtZSgma3NldC0+a29iaiwgZm9ybWF0LCAuLi4pOwo+Pj4+PiAJa3NldC0+a29iai5r
c2V0ID0gcGFyZW50X2tzZXQ7Cj4+Pj4+IAlrc2V0LT5rb2JqLmt0eXBlID0ga3R5cGU7Cj4+Pj4+
IAlyZXMgPSBrc2V0X3JlZ2lzdGVyKGtzZXQpOwo+Pj4+Pgo+Pj4+PiBTbywgd2hhdCBpcyBiZWlu
ZyBsZWFrZWQsIGlzIHRoZSBtZW1vcnkgYWxsb2NhdGVkIGluIGtvYmpfc2V0X25hbWUoKSwKPj4+
Pj4gYnkgdGhlIGNvbW1vbiBpZGlvbSBzaG93biBhYm92ZS4gVGhpcyBuZWVkcyB0byBiZSBtZW50
aW9uZWQgaW4KPj4+Pj4gdGhlIGRvY3VtZW50YXRpb24sIGF0IGxlYXN0LCBpbiBjYXNlLCBpbiB0
aGUgZnV0dXJlIHRoaXMgaXMgYWJzb2x2ZWQKPj4+Pj4gaW4ga3NldF9yZWdpc3RlcigpIHJlZGVz
aWduLCBldGMuCj4+Pj4gQmFzZWQgb24gdGhpcywgY2FuIGtzZXRfcmVnaXN0ZXIoKSBqdXN0IGNs
ZWFuIHVwIGZyb20gaXRzZWxmIHdoZW4gYW4KPj4+PiBlcnJvciBoYXBwZW5zPyAgSWRlYWxseSB0
aGF0IHdvdWxkIGJlIHRoZSBjYXNlLCBhcyB0aGUgb2RkcyBvZiBhIGtzZXQKPj4+PiBiZWluZyBl
bWJlZGRlZCBpbiBhIGxhcmdlciBzdHJ1Y3R1cmUgaXMgcHJvYmFibHkgc2xpbSwgYnV0IHdlIHdv
dWxkIGhhdmUKPj4+PiB0byBzZWFyY2ggdGhlIHRyZWUgdG8gbWFrZSBzdXJlLgo+Pj4gSSBoYXZl
IHNlYXJjaCB0aGUgd2hvbGUgdHJlZSwgdGhlIGtzZXQgdXNlZCBpbiBidXNfcmVnaXN0ZXIoKSAt
IHBhdGNoICMzLAo+Pj4ga3NldF9jcmVhdGVfYW5kX2FkZCgpIC0gcGF0Y2ggIzQKPj4+IF9fY2xh
c3NfcmVnaXN0ZXIoKSAtIHBhdGNoICM1LMKgIGZ3X2NmZ19idWlsZF9zeW1saW5rKCkgLSBwYXRj
aCAjNiBhbmQKPj4+IGFtZGdwdV9kaXNjb3ZlcnkuYyAtIHBhdGNoICMxMAo+Pj4gaXMgZW1iZWRk
ZWQgaW4gYSBsYXJnZXIgc3RydWN0dXJlLiBJbiB0aGVzZSBjYXNlcywgd2UgY2FuIG5vdCBjYWxs
Cj4+PiBrc2V0X3B1dCgpIGluIGVycm9yIHBhdGggaW4ga3NldF9yZWdpc3RlcigpCj4+IFllcyB5
b3UgY2FuIGFzIHRoZSBrb2JqZWN0IGluIHRoZSBrc2V0IHNob3VsZCBOT1QgYmUgY29udHJvbGlu
ZyB0aGUKPj4gbGlmZXNwYW4gb2YgdGhvc2UgbGFyZ2VyIG9iamVjdHMuCj4gUmVhZCB0aHJvdWdo
IHRoZSBjb2RlIHRoZSBvbmx5IGxlYWsgaW4gdGhpcyBjYXNlIGlzIHRoZSBuYW1lLCBzbyBjYW4g
d2UgCj4gZnJlZSBpdAo+IGRpcmVjdGx5IGluIGtzZXRfcmVnaXN0ZXIoKToKPiAKPiAtLS0gYS9s
aWIva29iamVjdC5jCj4gKysrIGIvbGliL2tvYmplY3QuYwo+IEBAIC04NDQsOCArODQ0LDExIEBA
IGludCBrc2V0X3JlZ2lzdGVyKHN0cnVjdCBrc2V0ICprKQo+IAo+ICDCoMKgwqDCoMKgwqDCoCBr
c2V0X2luaXQoayk7Cj4gIMKgwqDCoMKgwqDCoMKgIGVyciA9IGtvYmplY3RfYWRkX2ludGVybmFs
KCZrLT5rb2JqKTsKPiAtwqDCoMKgwqDCoMKgIGlmIChlcnIpCj4gK8KgwqDCoMKgwqDCoCBpZiAo
ZXJyKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAga2ZyZWVfY29uc3Qoay0+a29i
ai5uYW1lKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBrLT5rb2JqLm5hbWUgPSBO
VUxMOwo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGVycjsKPiArwqDC
oMKgwqDCoMKgIH0KPiAgwqDCoMKgwqDCoMKgwqAga29iamVjdF91ZXZlbnQoJmstPmtvYmosIEtP
QkpfQUREKTsKPiAgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4gIMKgfQoKVGhpcyBtYXkgd29y
aywgYnV0IGFic29sdXRlbHkgbmVlZHMgdG8gYmUgZG9jdW1lbnRlZCBzaW5jZSB3ZSBkb24ndApl
eGFjdGx5IGtub3cgaG93IHRoZSBuYW1lIHdhcyBhbGxvY2F0ZWQgYnkgdGhlIGNhbGxlciEgRldJ
VywgdGhlIGNhbGxlcgptYXkgaGF2ZSBzZXQgdGhlIG5hbWUgcG9pbnRlciB0byBwb2ludCB0byBh
IHN0YXRpYyBhcnJheSBvZiBzdHJpbmdzLi4uCgo+IG9yIHVuc2V0IGt0eXBlIG9mIGtvYmplY3Qs
IHRoZW4gY2FsbCBrc2V0X3B1dCgpOgo+IAo+IC0tLSBhL2xpYi9rb2JqZWN0LmMKPiArKysgYi9s
aWIva29iamVjdC5jCj4gQEAgLTg0NCw4ICs4NDQsMTEgQEAgaW50IGtzZXRfcmVnaXN0ZXIoc3Ry
dWN0IGtzZXQgKmspCj4gCj4gIMKgwqDCoMKgwqDCoMKgIGtzZXRfaW5pdChrKTsKPiAgwqDCoMKg
wqDCoMKgwqAgZXJyID0ga29iamVjdF9hZGRfaW50ZXJuYWwoJmstPmtvYmopOwo+IC3CoMKgwqDC
oMKgwqAgaWYgKGVycikKPiArwqDCoMKgwqDCoMKgIGlmIChlcnIpIHsKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBrLT5rb2JqLmt0eXBlID0gTlVMTDsKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBrc2V0X3B1dChrKTsKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiBlcnI7Cj4gK8KgwqDCoMKgwqDCoCB9Cj4gIMKgwqDCoMKgwqDCoMKgIGtvYmpl
Y3RfdWV2ZW50KCZrLT5rb2JqLCBLT0JKX0FERCk7Cj4gIMKgwqDCoMKgwqDCoMKgIHJldHVybiAw
Owo+ICDCoH0KClRoYXQncyBhIG5vLiBZb3Ugc2hvdWxkbid0IHNldCB0aGUga3R5cGUgdG8gTlVM
TC0tbWF5YmUgdGhlIGNhbGxlciBpcyByZWx5aW5nIG9uIGl0Li4uCgpSZWdhcmRzLApMdWJlbgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYy
ZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2Uu
bmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYy
ZnMtZGV2ZWwK
