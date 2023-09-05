Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B81792322
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Sep 2023 15:42:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qdWK3-0005Hv-W6;
	Tue, 05 Sep 2023 13:42:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1qdWK1-0005Ho-2b
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Sep 2023 13:42:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sPFyAd6vE7Fhga95vtDmxscqUDzCrLSfbgXMdRGIXrs=; b=JxVkU1R87E5QZBVn+L6E0m6ErM
 Rjx8jugC5WYRR7zGsum7zFOw/UJ23DS1Nvm1JCFSApxzWPZbAY2LVPS9L3emxTKq4KF7kZxtqx8XP
 4wzRQ9vpqJIJUSvAC1mQA929BCxB0aDag2Y+ZZdK3zoEvCVUbGezdB1DaY1LTBX15fUc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sPFyAd6vE7Fhga95vtDmxscqUDzCrLSfbgXMdRGIXrs=; b=cTJQ53uIW7IHtbrgUY/w4Jdo5U
 dnbbTZhJogsRs2yxy0rhjX8cokcFKjh243aas4SOI5bkjtuYFmCBhCGvkrPG3arH3a/iJvslFYhqI
 VHciLb1wenBoEyJuxvp6LxHJIu0pi13Mxn7zYynpQFAoJ0gpqwEPaqIaAeqpOBKI9+9Y=;
Received: from mail-tyzapc01on2129.outbound.protection.outlook.com
 ([40.107.117.129] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qdWJz-00AKk3-3i for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Sep 2023 13:42:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gBtsR07eRaDXkRIALsMzGAxKdo0XWmKJT3QUHDj3RKnOgW4v0zHWa9sUnLAt1aVYtaRTFF1CPM2Ib7TdpCjw+/A5tIEWxOxz7fzd3EZ8gkphXgFIRaRDEid94gMylaWokCdbZgHSVCzxABjEtTyl6xioy/URIao2Ui3CMlmh8PEntX8dmpRZHMQBlJUpIKpXx+W3mTuhdLhMqj9VsCYle40gIbZbZ4Geb1MtOh7nIicWB1HuIuahS5W30Wa9mUmaeJ+yMR5zgm8otd+GLa4E31iFN761VWW8qVXtH60/o7HkYEDpwH3+1eNKeeeKP9OOl1yyQt7hXRpdpsiInbQe9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sPFyAd6vE7Fhga95vtDmxscqUDzCrLSfbgXMdRGIXrs=;
 b=NPQLd+1oVhmxvi8O3TlfqBzZV9VnIXLJa3m4sn+e7TKo65Nc5ugSojf32T870+0QSuPSiiDSSruaaLHL3QPe7SmwO83UwRnXVkrFDjUDBxuqsqgs5noQTasqF27J/VnUqhq0gRWYVIazcvvosqtiUUjtmF7ER3NzVAU0HUV45ud4bnBvtoJW5JZuzF1oARmLfMgwYRv76wssqGyai3GlwUQOlrgWX7y/wqCA0DlPh+/azao4Zv0/HUMIiDJqC5/d0k1nGkrFMvb2ie6Shn/Z84LuFYn9UQjze3iR3LIbBVwOvA/6CDHvn8J5k1jKJGH4vHk5JsNDirQOUEiNZTF9Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPFyAd6vE7Fhga95vtDmxscqUDzCrLSfbgXMdRGIXrs=;
 b=D5E8KjowGbAQiVb66Dl8D9AHM+W0hDpws84TVHBvqxszTbTuZn32xBwtmcyn7Tcp9fGJIsVEGdUNCPcd9KAPeLlA5bU7AztXIc9KhERN8/16TJ7lCBMdUwSzOhmzz1Wnj36z6YyRprnTd1LfqXYGYiUdFQMgbfhj2dZHO9k/h/qyhDFtMl1jJel2bpe9JixiX/0rvzDcuQVJ2PKW6pYkIDvC/3C83anIrR2KFVXJXVKxDStDytZwy/2Br2B76L3jrBZxnzskWxmio6ueeMC0jCLtjbr3fTBBJa72It0MtgMSk/igqRn0eYLQ8bP4rCneaYqi/EXL45Cwaol05+0W7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com (2603:1096:404:fb::23)
 by PUZPR06MB6223.apcprd06.prod.outlook.com (2603:1096:301:107::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 13:42:12 +0000
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::60d3:1ef9:d644:3959]) by TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::60d3:1ef9:d644:3959%4]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 13:42:12 +0000
Message-ID: <e0f7b14b-b50f-4cee-a187-35383147aa3e@vivo.com>
Date: Tue, 5 Sep 2023 21:42:08 +0800
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
References: <20230831071011.56116-1-guochunhai@vivo.com>
 <0749d51f-bbc3-dfcb-93e3-c6c34614f403@kernel.org>
 <ZPYIfvwCd/UpMS8S@google.com>
Content-Language: en-US
In-Reply-To: <ZPYIfvwCd/UpMS8S@google.com>
X-ClientProxiedBy: SG2PR02CA0061.apcprd02.prod.outlook.com
 (2603:1096:4:54::25) To TY2PR06MB3342.apcprd06.prod.outlook.com
 (2603:1096:404:fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR06MB3342:EE_|PUZPR06MB6223:EE_
X-MS-Office365-Filtering-Correlation-Id: 1524f976-7ea5-4391-d78d-08dbae15e847
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IBaSYJtQzYRpkfFm0tuj4d4aZJZQ+5XpIGFkc+e4l5f9z/U1EnTRMvrM7jWAqh/auB3kKd2ya63oJBW2fEBfN/11AkOq6lhZBEQFLRbq56nUio5JAzuhDS8REuLYzlDepOzfRiPvH1/Ja4WLlcwGiwmxpMTMt8gBMyafaRfRBQo2zQ41nyumtHR87DeizIIz5d7PTyLnOqzwy8MVuxPsHnIe0uvk2qUSWmA33e2UnAFSbpOHantGYK9ncZiHFPe7ewK5SjrFqBvfv6T5fzljq3tEedbaz4BplQbkYB4WKW7f5aFW0MhCl/DDXXYzkikdvRE9viFGjoryfZmmScMeLnnPfm0ylpu7lkngDzjOGahAR42yizWuPBXUAjHEQc+IqUimk2gMa0Ov6VPvRUEUSt0X3R60bb87zeCMYdajhvHBGoOmme6L11l9jheEk6CEpg3LEm6kqmOsLNqx2H58uvfGxLqZJ5S1Cngr0KYFmyl0048p9pUkiwZBtHLctC1kL3+SnanuVXoY8wYIpdfmBe45DpvYwiXcumdhDKnT30z4HUBAPSs5vyfvorbquABkkoSEstH3JYkcTe1furkbE/B6oksqyb+nEcwpGn0Owh3KkI+EGNiN35IY/eHAHB3xnxtF0ycAVNUlJ/pllYqXEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR06MB3342.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(136003)(39860400002)(376002)(451199024)(1800799009)(186009)(8936002)(5660300002)(31686004)(110136005)(316002)(66476007)(36756003)(2906002)(66556008)(66946007)(8676002)(4326008)(41300700001)(6486002)(6506007)(26005)(53546011)(6512007)(38100700002)(478600001)(2616005)(83380400001)(86362001)(31696002)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0I3eVFiaGVWUmw1YXR3bDVTTHZKUDg4UTAvOXdWcXkzOU5ISGEzU0xYbkg0?=
 =?utf-8?B?eWhtVmN5TjhjbEFLdnZ6eEZFKzhvZWdhbHRVWldHYXVKRGxsSXg2L05xZUZk?=
 =?utf-8?B?KzJUaUM3cXBvUTNpOFNCVjMxRlNPampXV1JiY1VSRG1vSjlGV0t2WitsRVhx?=
 =?utf-8?B?RWhQRWd1dGhMV0VhcFBSaEZjMFFQd1R0SmpvOU5TalN2QTNWNTNVd0EwbzRS?=
 =?utf-8?B?eEVJLzk5SHpYeG1LNklNaFNBT2l0bEFyM1ZSdGFleU53b1RLOVRrNDBwNFVL?=
 =?utf-8?B?VXpqajJZQjAyNlhDc3lTQjFXbnZadHhkLzVsWmdMYU93K0Qrdkp5WVdZVGo0?=
 =?utf-8?B?eFVnZVVOR3gwTDBnZVRkaFRzQk02cEVKL1V4c0xZRE53MEFWOUlWMm1TcWlT?=
 =?utf-8?B?c0NOQ3k3RmZjRW9VUXVFcURpS2xQbGthZ0lUZmpxNzFoTUFiM21mSjhVdW5Y?=
 =?utf-8?B?NStlek40M21VUkNhVWpaOEF1bXNBeXdoTW5yNUdKUlp1elhERmtmNnd6M1FY?=
 =?utf-8?B?NnV3V3gwWE8rTFNEcC8yWUVZckhXU3hSeEljc3cxU1hRemZzSkxxdWJLZjhx?=
 =?utf-8?B?aW5Wbi9ZSmZGbk8wYzF5ZGM4bXR3YjA5YndxcUJ1MnpJTU9xWFZUV0VhamZQ?=
 =?utf-8?B?aWVYRmhhZDFjM3k2SEMwY2lBNzIzYllzY0g0NDRJS1VUZ2FWYzZ4WXBodGFE?=
 =?utf-8?B?ak1MciszeUdRd012WGpMTnE3ME8zYWM4ZE9ieWd4ZmhDTC9OMGJ6c2N4eUNZ?=
 =?utf-8?B?am80d1hsQjhMakxEVW5ja3FLL2lPRGlsTyttdkdxUVA0OEtxRlJ6L0dhVzlH?=
 =?utf-8?B?bnUzQ0E0VmEwL1VUOUJWTElPdWNKQzFpTGs2bW56K2ZjMWdkYzZpYXMwRDFW?=
 =?utf-8?B?YXp2aWVJV2Z1OE9yYTRlSURBYitlc0phNU1lVy9KL085MzAzN2hxWDJGY3J4?=
 =?utf-8?B?MXFXbG9qRWZVbmgzZWVIUXlXbGJKYTNnVUhycGgvRUk0Q1NvejZwNkpGczl0?=
 =?utf-8?B?ZC9rMTV0QWUwWkFFQ3lTUnhzR2lPWExwZHFRMXVrTGtoaGZaRE53WlJ2aDdR?=
 =?utf-8?B?T0VqNFRiUCtXNTRybXdsNjROL3N3YmxuQ3ErRk4wTFRIbEdQcEorSFdyNVNR?=
 =?utf-8?B?eWF4WlZ6OUdLei9JYk1UM1VBaEk4RnJQREUxVHRFaGxsSi9uZmZRd0FIY0dY?=
 =?utf-8?B?R2p3SWw4QkFxcU85cGthalY5U1I3N05KbmEwWTFTQWNMZGJ1dVBhOGFnUHRL?=
 =?utf-8?B?VE5xZUpaTitySDhQL0h4ZkpPS1R3RWdEZU04MjJOa3pjTjcrYmxIcEJOeTNo?=
 =?utf-8?B?VXNqaE9EWkhpVFkyd0V4bXpFYzF2YTN0ZVh4dEN2WktUbkF6VlpYN3pRdU1V?=
 =?utf-8?B?UFJ5ak9acW5Bb2w4a2JHaTFFN3I3NXJnZ29nWVh2ZVZzWHo3ZkFlVUNJRUNF?=
 =?utf-8?B?TkxjaXZhVTF6VFJ3dmF1WXcySk82ZFUwSDVvSXBPOEJNMDg2RjZHTUJUeFMw?=
 =?utf-8?B?NVJVeHJGUFdyaGZ4emtQK0ZSNnJ4NjVpOERJMEF1bDcrZW45NUFaaDRzR3ZX?=
 =?utf-8?B?RDlIQkdGblAxejhmK28zWHJsMmlQZkdjUjZQcVVhWFZIVUhOVm9iZ3dMUlFC?=
 =?utf-8?B?TkpycWhlblhZNDVPYUpjTlVrbzhyOWJsTFJWZURxUFI2NFdUZ0tjcWN4Nmc3?=
 =?utf-8?B?WENrTi9wSUpmSXNaTnpFV0F5YnVVZmZLeWNvRGJndTVzUHp3eWNTSldCNlpV?=
 =?utf-8?B?Y09DWnkwY0FvM1FFWUhYS0lNbVczK0hMTDhGNml3Q21Kc3Q5a1pVVWtEOWFF?=
 =?utf-8?B?NHRaL2pUVmo2TCtXZ3VmZEJRWG4waEdWRG82SWdHZndNUVd1a0ZPb3hSK3Na?=
 =?utf-8?B?cHRiaVhSakd2Mlh2NWl2Si9HV1o2dzJOL3N1aHZSVWo2aHVCRGQzVm5TZHc0?=
 =?utf-8?B?QVhVZnRySVpLOWM5SlBRN2hjNU5MUVlxOFJMZWI4ZHhIK25KMVRzbm00V2h5?=
 =?utf-8?B?U1FoVGRTR2JTcUhjZVc0L0FWM1F4ekJXU0MwQ0ZiLzl0OU1meEM3SFl3NWlH?=
 =?utf-8?B?eTVmODZpUVUzZWJxZkFHWUlzdTdZMVh4T21sRnpNc1l5enNkU0VQaE5KTWU4?=
 =?utf-8?Q?9YfFsXyeQMB0t6q/F8EJt4Dcc?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1524f976-7ea5-4391-d78d-08dbae15e847
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB3342.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 13:42:12.0244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WgC3z301/3vG7Y9HhyEkYorhLih+m9jAgBPRL/zDI178UMUL64RbZ4MvRB9/H446N+RH3P009iWd5Fjq3nufFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB6223
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/9/5 0:40, Jaegeuk Kim wrote: > On 09/04,
 Chao Yu wrote:
 >> On 2023/8/31 15:10, Chunhai Guo wrote: >>> The commit 344150999b7f ("f2fs:
 fix to avoid potential deadlock") only >>> requires unplug [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.129 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.129 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1qdWJz-00AKk3-3i
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: replace blk_finish_plug() with
 blk_flush_plug()
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
From: Chunhai Guo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chunhai Guo <guochunhai@vivo.com>
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 2023/9/5 0:40, Jaegeuk Kim wrote:
> On 09/04, Chao Yu wrote:
>> On 2023/8/31 15:10, Chunhai Guo wrote:
>>> The commit 344150999b7f ("f2fs: fix to avoid potential deadlock") only
>>> requires unplugging current->plug. Using blk_finish_plug() is unnecessary
>>> as it sets current->plug as NULL and prevents wb_writeback() from using
>>> plug in subsequent loops. Instead, use blk_flush_plug() as a replacement.
>>>
>>> Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
>>> ---
>>>    fs/f2fs/data.c | 3 +--
>>>    fs/f2fs/node.c | 3 +--
>>>    2 files changed, 2 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>> index 916e317ac925..77b4a55d6d94 100644
>>> --- a/fs/f2fs/data.c
>>> +++ b/fs/f2fs/data.c
>>> @@ -3346,8 +3346,7 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
>>>    		atomic_inc(&sbi->wb_sync_req[DATA]);
>>>    	else if (atomic_read(&sbi->wb_sync_req[DATA])) {
>>>    		/* to avoid potential deadlock */
>>> -		if (current->plug)
>>> -			blk_finish_plug(current->plug);
>>
>> What about?
>>
>> if (current->plug) {
>> 	struct blk_plug *plug = current->plug;
>>
>> 	blk_finish_plug(plug);
>> 	blk_start_plug(plug);
>> }
>>
>> Jaegeuk, thoughts?
> 
> By the way, do we really need to reuse current->plug again? After checkpoint
> being done, we can use the plug in __f2fs_write_data_pages. Are there some
> numbers to show the benefit?
> 

I don't have a number on this, but I think that reusing current->plug 
can help maintain the original intention of wb_writeback(). 
Nevertheless, it can be a viable alternative to use the plug in 
__f2fs_write_data_pages().

Thanks.
>>
>> Thanks,
>>
>>> +		blk_flush_plug(current->plug, false);
>>>    		goto skip_write;
>>>    	}
>>> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
>>> index ee2e1dd64f25..c4b5717a8c1a 100644
>>> --- a/fs/f2fs/node.c
>>> +++ b/fs/f2fs/node.c
>>> @@ -2126,8 +2126,7 @@ static int f2fs_write_node_pages(struct address_space *mapping,
>>>    		atomic_inc(&sbi->wb_sync_req[NODE]);
>>>    	else if (atomic_read(&sbi->wb_sync_req[NODE])) {
>>>    		/* to avoid potential deadlock */
>>> -		if (current->plug)
>>> -			blk_finish_plug(current->plug);
>>> +		blk_flush_plug(current->plug, false);
>>>    		goto skip_write;
>>>    	}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
