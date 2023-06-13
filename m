Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D181E72DBE6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jun 2023 10:01:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q8yxw-0000mZ-6V;
	Tue, 13 Jun 2023 08:01:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1q8yxu-0000mL-QU
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jun 2023 08:01:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=46tvpxVbU2zFpq/Iyuhir9BVuj6+xMYy5WaRMx8qxWE=; b=nPEt1leqXYmVGIaHhK7g7cu/pA
 3WweuWF4QGzNtiXVtkmLj5hMIcVQbCKN/bmO8CooYKwwR72dF//IfLSSV0gOlMbq8WFjpHPN2bXYK
 D05jpJ94OCOz/y079oYySkWX0Flxb+46ID8y3Hs8raqP/wvQ7Y3Rg7HuFbIBov9x50FM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=46tvpxVbU2zFpq/Iyuhir9BVuj6+xMYy5WaRMx8qxWE=; b=ehM/loq47PxcS/kqyf91vzi0VL
 B2vzo+iIIt907TVUVRXzC2w8MI0/Ym1gtc5xpgrwD5rDohvAD/LF7PKxnrCA/sxghB7z488+RHCJZ
 wGp7AkhMCKGidecckFJMYUGRkkMJNTdJrz35pvFYR3FKCaqGTO233uBZbC3pGbhUprwI=;
Received: from mail-sgaapc01on2101.outbound.protection.outlook.com
 ([40.107.215.101] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q8yxr-001XT2-4m for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jun 2023 08:01:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9Uj78mnQJZD5Ix7kUJq1X/8WtS8bKO+cXDrZ2O3gj39vMdGwgZzs9p6G4lLYuzmmyuV2dhvwZwl4q9XtiHzngc1KSLMk2QGgzY4EZcmRc37ZZ9DHZU+wsdKe3OuW87AfKAbB5ARbYOV/UwZUUZFmDMk+fTxjFeVp1+ws2MvoHnUgix34L4U/bkzSybTvukgyNzNa6JN5rZIcxXPf/PiG3WbwrcYUs88uJJfI7fUwaKWtNA3Gh+jJyZeS/wgf2lSVx5ue9WO1Ebo+9bS0y7lb98O3bj7NcaA07XlTTbc8bjzBc6y+/oINz4PEFlY+glhISSqOctOlV4dn2wtnUEXng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46tvpxVbU2zFpq/Iyuhir9BVuj6+xMYy5WaRMx8qxWE=;
 b=PYK9+hMaUlWzyAb5zTLfAJtb4kqSuSkp4I9ftHLJkY48KD/7x+/hEshnPxswcK5Yf2JnvBekHz3DLM30ey5MepmH/2neb/JFKbh0lXBOhXVw42vWY3RRiVe/cmwpvi9TNxPzM7zicr6ysnhto+dX70SkUueR5QiUnw0UN8Nxxz6bY+7tgdifDSrjvEzF2HKMj6YiPSjAYt8dDnqNu/aXU2OsawNOl+BT0GKF05urvj4EizMzJoBljI41qyEhxZ1wFY7B4zQ9p0ZNLbjj8YQ970imazuerkYCwiOYopXywLv9waiLnAKfqwssvI7biaU/e7TMG6eDxsGDgtJSSbRLeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46tvpxVbU2zFpq/Iyuhir9BVuj6+xMYy5WaRMx8qxWE=;
 b=oLah5YHIGY39rBb/FXE9IbVfDNxZ77+20ldt8dVzM5tjh5IxjAEMpdkJLgDvSeWZGIjijy/fpfK5Whj3mOfFpKE+nVbSqvd0TcE6AsAMVEOJ29NrzQpEoM3jcbexbyo7focL1nMn4LxKVp4WKYBWwl95l2U5BSqkFBRzWtgDwO9rgk1pA6UKaGPx840s/BCJa9wfpr4ejMrmmJRf/95fRKj4SNhAjPX32vKC963P3iKL0jjvU3a1CmtaOKvOJglpTAk97p5Ecp5o4HkDUdpIceEZ+RPmMgYmAkWG1fhC6bqf00dPG2f77yKdf9YcUpzHbuodsEs/Ao4cCDe9zq4FSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB6698.apcprd06.prod.outlook.com (2603:1096:400:463::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.38; Tue, 13 Jun
 2023 08:01:10 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%3]) with mapi id 15.20.6455.039; Tue, 13 Jun 2023
 08:01:10 +0000
Message-ID: <df7cd7fe-9d67-3438-ad2a-ac5e250a2e51@vivo.com>
Date: Tue, 13 Jun 2023 16:01:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
To: jaegeuk@kernel.org, chao@kernel.org
References: <20230425165857.29175-1-frank.li@vivo.com>
In-Reply-To: <20230425165857.29175-1-frank.li@vivo.com>
X-ClientProxiedBy: SGXP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::30)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB6698:EE_
X-MS-Office365-Filtering-Correlation-Id: 9edb8aef-a01f-4f1f-dc5c-08db6be4593d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EYlisJBsag0ooNTOQ+afSs7A3FUgI0wMYns5y4CKknx/mpYj7/m4W7N4ZAj1le/6a+MG4l3PHiLGDtM/ozktz4/0oem8BFNSEiA1sYF29Q9q92pdJL9kVxjWkXdrgMI8I7g75QYNezRTKwbmEUVmdZ5M6Np+RVZLzrQjokD0VcM+luritXajAKYZotk8oq0rO6g9On1z3+m+Al823dpzLslwO9uCrHImdQKpXcV8iT+X5txpFeNxp9fKEAq2t8S/pzIRJkj/PTXfrdEevDAET+trs6zxGGeWgPiTkE2/ddkQOWaOp81OViTmMQYYT9bSSVE9jaumHxXoxb5gg7aHkBwZjb3toO2vlIv2nDxR2pYPhoDIycCRLuVXjTB1Q5ME4vkNU1Qw9c2nsal8K9uaOreA4SOM7RaYIT6HplsThMk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39850400004)(376002)(396003)(366004)(346002)(136003)(451199021)(2906002)(316002)(478600001)(41300700001)(6666004)(66946007)(4326008)(8936002)(66556008)(52116002)(8676002)(66476007)(31686004)(6486002)(2616005)(26005)(6506007)(6512007)(186003)(36756003)(38100700002)(38350700002)(558084003)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUd2cDBRamNwdzNxYzFxVFZOR2VnUkVZZWdaRFdMVVFmb1RweWNWd2JPM2Zw?=
 =?utf-8?B?SDBRaTFJeUZjOS9oR0R3YkhWMktYSXB0SER2QUtTaURBRWRDS3lYSFlaLzBi?=
 =?utf-8?B?VjJLODNjTVBnRlJOd0JrZmJBc21DSGp2M1BOdTBFalQraUZFeUlIVVd5UVAx?=
 =?utf-8?B?UWFDK1BqZm05MG96S1hBSU1GellmR3FsZDNHV2JCRURiaDVNZVlWS1ZHdnZq?=
 =?utf-8?B?b2JuTGVwOElEY1dDVllkMDVHRVpWeDZqa1hYbUhiWVV2a0o3OGRqSkZjTjBR?=
 =?utf-8?B?T1dMME9WUFJNNzJNUUJZTE9wdnNJU3U2K2IvUk1ta2VsejBpd0hPZ3ZUMlNx?=
 =?utf-8?B?cUFZR3d1MWVSdXpMczRadzdhZTI4T0pPN1RYL3FsZG1odEVLRjNVVzZDTE4z?=
 =?utf-8?B?ck56amswSlo0blRoMVUrVlVYU2FFdC9jQnVVL2E4SGIzN3NEUi9HZnNvYlhw?=
 =?utf-8?B?SDZYdXpSMEd0VzErcGVPVGdhT0t4S1VTZTVkWGdIRHhxeEhHZHlKbzlqZlo1?=
 =?utf-8?B?cytBYVNLa3NobHpLS2NHYTBuT0NacGlReXBOL1U3WmliTFR1bGhSamRDSzJo?=
 =?utf-8?B?QmpjVnRmY1dVNjdSTmV0R3JiTjl5a05halBlZDNzREVCby9sMXJyMDU2emlS?=
 =?utf-8?B?dHVSMDNBQXFMZm11bUhKN2xVMFJZRVExSTQ2ckprbDl0ZS9DNVdpeTVjYzFp?=
 =?utf-8?B?ZE5ISDE5SWc5VTAvbmFJem9iNVZ1UXFzQ0Z3U0lnOFA2V2dCNDIwTEt1d0Fx?=
 =?utf-8?B?VGFiVFRyZENwMTBuTVIvUTVwbFUzNFlRSkJGZFhlRnA0ZXdwYURsKzZzQmY2?=
 =?utf-8?B?aXZ0NmZHa1kydGx4U3YxUEw0T1BxTW5NSlQvQkV6SkNQTjh2d2w5YzhheVQy?=
 =?utf-8?B?V0dVWUVQa3VTUXNiajJ6U3BFbkRvVTFlZm41dnJrRmNLaDFSR2lzV1FORXFR?=
 =?utf-8?B?cnRTc0YvMENjbHlIejBhMEl0bXJkOFFVb1RjR0UyTmxwVkwremRkbmltdmdW?=
 =?utf-8?B?dDV4cnh3c1pxMHN5UWtweDVGUWQvcGcycytPcVRJdjIxeEtyaHRUMU1zci80?=
 =?utf-8?B?eVhoekxpQlZRNTJ5K3VYT2V5TC9kck4rdzU4K3JQZi8zQjBPTXFWUmhnYUFO?=
 =?utf-8?B?Q2JvRzlBL0ZLbjlXQ0hkUHNGYWRiSHE4elFaUm45ZGViWklTNjB2by9OMFJL?=
 =?utf-8?B?Wkl0SVJPV09PVUhoK0oyYm5OaS9CTVNjZmptS2xzbFlYY1VJWXF6UlcvM1RS?=
 =?utf-8?B?Z1U4QS9YNWYyN2FHcHpBOEdRYmtiMW41b2lzODJ6V1JjM1VQdDBRY1M4Q3p4?=
 =?utf-8?B?bGNCZGpQNTNzUHV1SkZSa2NRSzB5eE9Oam5jdUp1UHZKdW5EczBOcFFCTFd0?=
 =?utf-8?B?UmVmcGZDS2hmZk1wcXgrbG5CMkl0d1lzNXcwQnh0ZDNwY1JNbUJJQS9UdDNo?=
 =?utf-8?B?RkNhVUR4c3VuZ0ZFRXgzT2ZqdEJtQlZubHZidEhPWG0xQm5mM0FmMUgySDVQ?=
 =?utf-8?B?c3A3UW9lNDRtQzZuY0dlU01ZSG1SVGJGVERiMjJxZnBKREQ0V1FBT3lhQitN?=
 =?utf-8?B?Ky9POUN1ampycms4cnVHdGFtRTQrSWRpR0MxcHBvZXVjSU96Q3ZjM29zdlgr?=
 =?utf-8?B?d3EzRzNLa0k4YjJjVVpPVGRHYy90dDU2WW02ckdYOEpPU0JzSkZjMFU2bjVm?=
 =?utf-8?B?akpOQlpQQ2x0U3VmZmNSTUFKdzlZS1Z2eFk5RElWT1V0Ylc1dUZpUnJwUjhh?=
 =?utf-8?B?eVJVOEtlL2Rwd2NvM2xNZmNXZ0V3NVBTQ3RvN2Vhbk45VkVma29QUlpCcDVu?=
 =?utf-8?B?RCsvdGlZcXlYMFlJd3RmaC9RZzYrS1psbk9ZYk1LTFc2T0d1QWVVRm9FMGJq?=
 =?utf-8?B?VDhubkFlWFduWnRuMmcyaTNqVDFOR3NLS0hNR01HblpWUlJWSDJMSis1Zm0w?=
 =?utf-8?B?eEJHZFAwMW0zLzB6Y3ZUN2x1UGd5elZLSHdJRkUrdVZDQ1lRdjlOTGpWZVR6?=
 =?utf-8?B?MlMxUTNmcEdKOUdGQzI5NlFnTWRwN0pYRkFlbkhDWDlvaU0zWm1ybElId2Zu?=
 =?utf-8?B?cUprekR5bU5Ham8rTGc4VmxIWWdiWVgyK3d1UHp3MjMwVmtoUUY5MXAvZ1U1?=
 =?utf-8?Q?L6NUoozSdi8uhENC+kdO8n54m?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9edb8aef-a01f-4f1f-dc5c-08db6be4593d
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 08:01:10.0972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lzK3ThWzhPEZ+EogRann8P7+HL7UsTOvsvrn5ZXHknBEnK3jp/gmSyxZYZ9jdNyl4gfdQ3W8RafUWsfTl1XFmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6698
X-Spam-Score: 1.7 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  ping....... 
 Content analysis details:   (1.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.101 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.101 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain 2.0 PYZOR_CHECK            Listed in Pyzor
 (https://pyzor.readthedocs.io/en/latest/)
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 0.0 SCC_BODY_SINGLE_WORD   No description available.
 0.0 BODY_SINGLE_WORD       Message body is only one word (no spaces)
X-Headers-End: 1q8yxr-001XT2-4m
Subject: Re: [f2fs-dev] [PATCH] f2fs: no need test opt for f2fs_issue_flush
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

ping.......



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
