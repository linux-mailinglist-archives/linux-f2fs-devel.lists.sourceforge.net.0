Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B64B2724099
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Jun 2023 13:13:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6UdI-0006PN-Vj;
	Tue, 06 Jun 2023 11:13:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1q6UdF-0006MZ-Ki
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 11:13:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+kIkaNxr0xnn7AeQS6rpB5CqvHbVnqM7WKYxRo+ix0w=; b=KS/DwrVrUUiNUkxP7qfYphWT5e
 O8Eket1JyBcJXat05Fvz0up8F4sAiLGxwv9imQrEoTqUYx51/Rj+Zi236sLWZUUI4AVHxdxQ5HWXo
 e4NOLhdZVuwkPkOPAz08rfZDwP6PILc4odLx3NwMd1ZZdN4Lvm8MebF1Lrltuujwvh8M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+kIkaNxr0xnn7AeQS6rpB5CqvHbVnqM7WKYxRo+ix0w=; b=fPhMSOdzQD0cJlbHu8L2S8cCzu
 6DCwWEHCXGBAki/4YdGZtqrcQ5bG6QUkmPty/dkfNN1Sb7Xm3XP2EnlV67jr+jfYgy3C/zxcPbBCy
 ajmcgFmwbRPqOhS1AKsCF3vYgL1EEbjoHBjegx9EJ/nd90hqyJbrM15z/hGmju+9rBms=;
Received: from mail-sgaapc01on2091.outbound.protection.outlook.com
 ([40.107.215.91] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q6Ud2-0003yj-G0 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 11:13:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BywCx29V3xn8eR/1hfeIr/5C90CEBNDwIz9NtPP1VCZZYArlIP/q6q3yh/5PTyTP8L9GUY4lJJaER3dKyDjGgGRtfWLHZQBX3pb3WYfMM0pjfftykHhfmXFpVzLsoOqqbDHTgvwKRMuLE1M8oJoBNaLcTK2ZUJyhwOlZfjK45JChrB+YlY0ZQ9IAa2z1l7+quED2PDO4L8enjLVawd67ZX9+P5d7e+45hTnoFtihu5HNzuQ+dtXG9yLIVHukU64YNpxHAOK/02bBbOnIkgXPSibJ23Pd66kc0brRJc5IsHk4oL6135rNlppCjZyfo/EI41VFkiiJiHhvO3iMSJiN0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+kIkaNxr0xnn7AeQS6rpB5CqvHbVnqM7WKYxRo+ix0w=;
 b=LuXhi4BQr6z/YqtxOqsd5Wl+AXOpJ+5goIkIZ/xwsTmbuY+46/Mb7WQiS87mSVy8odogpTV7AdRUVU3shT9xZzBQlFDQFOy9b78r3te3cujg+AikW6YCbvwJq8jwQ1VOqzBsN7i5p5cg8b4FmErIZXsXXNJWKgxZxKUSo6ds8p52PKsQyluI8GZGz8ZO8gdyTC6208NPiY7W6Qs5mYPi5aunKrmWwywwnmYlNTgqfKskg02fZ9EWOdzhY9ZtpVQZNGktrzWoqHNGy+NIJdB9umTiZelSyicNacm3yzDNpiGYUsxjAD0Ne39XafwSOZown3c0cpM5s6dlw1ccXKbbdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+kIkaNxr0xnn7AeQS6rpB5CqvHbVnqM7WKYxRo+ix0w=;
 b=op63Jr1IwqRZ7fjiLj5lRJteIpNy5gSTvIU8fLW9395m/Ivkb+BbrxdJ1G6TfE780UWPo4FMoNPjqfA/dW3GBq99RxEfS2wo930FUjQLT6VCZih4oioOi/3nIkfpK1HeLFNMjsysyb7MkQ9JJ29ffjW1K0GMgN+2l8b0lBFU7r2Bosn+o1hDwPjWzmgEJdexfPf2BuzDciDm7L8PffZ0mUssign56WMRoBLOqN7bHdlYCHEu1/g7MwzMKgK47LXASnplriYrnJrYGZr5FQZkUDT0sCj2DuAqdA/sdbyB9TLCWbRrusCuuTwgrHY7irmjbc5Yo5ACSlxj9bOP/nsxYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PSAPR06MB3912.apcprd06.prod.outlook.com (2603:1096:301:37::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 11:13:23 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%3]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 11:13:22 +0000
Message-ID: <29bea47b-9085-05e7-d254-a40007e6c7f3@vivo.com>
Date: Tue, 6 Jun 2023 19:13:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230531144006.7307-1-frank.li@vivo.com>
 <e8e4758f-5895-acd7-27d2-4b72b69722b3@kernel.org>
In-Reply-To: <e8e4758f-5895-acd7-27d2-4b72b69722b3@kernel.org>
X-ClientProxiedBy: SI2P153CA0009.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::18) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|PSAPR06MB3912:EE_
X-MS-Office365-Filtering-Correlation-Id: a7fdd4d5-da3e-4d26-8d83-08db667f08f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +S9vCxee+1W7ytMNy1Iy6pZj1W0g+aOch5Nw06zFW+DSJnr3P50M/cYw+kt+lQzWbSXLTCGGWndjPlH9drE+S08hEvskYdgW+snPfCbVCxUftLX5q6ws3Wup3RIVNGGWNwHwWZb3BICJqRdWmQo6yUTq/k4QB5Er9ISk6ijWNY6QiqAjNZGUUfjmJ8xEaMmLIK0oWZwGLk6hieWOeVzxU6KTBxBIFMJ/j31EY1ukc0JB8gFxAB4pLXRpbhiG7K5FqtgIxrhWBhAfYrK97FRvGnBiMF0Iyr8rGXu3RgS0OpQQH2VltQG5VhvcSWrvTYyz65hrF4dL9AorBznboPpm/MUljWt6BDnPTqfIg/x6O/X86vDgTozqby8Mi1l8IldC5u/d+cSRD8fHNBBZ+0vGVXAWT1EDaDWOyyTlxKK4FnH55w6gcvqInXvhWq3yZSd7ZWGhxduxqM9BC+6t9/u/pVOU5rcFxNLaFXF1K5TLr7I8uPqOQmO8yq0QW+DYZwkLJwV0hzIH/xkIm0Hm/TmFqAZ0hxBYxvu2VF2urVNR6GRatUu6lSAcFX5C93ZkMUgLjf3tMvXwloOk3tvq+h3p5k18HeNP2zYgo9Pre77qsuSzEwkJxQQuqMRZ7gyrLV/2cBzs6svQoCs5NHkZdu/roNbgfLPVddP8ZhIQy4NFf4GIHyB8QVlgexn9SuXd9giI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39850400004)(396003)(376002)(366004)(136003)(451199021)(110136005)(478600001)(5660300002)(8676002)(36756003)(86362001)(8936002)(2906002)(31696002)(4326008)(66476007)(66556008)(316002)(66946007)(38100700002)(31686004)(41300700001)(38350700002)(83380400001)(26005)(6512007)(6506007)(2616005)(53546011)(186003)(52116002)(6666004)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTFSZE43T1pQMVM0YlhTVlZLMUtkVTR4T1N3b29pRVliNmFyWXEreC9XZ09E?=
 =?utf-8?B?SWxHcThpdmw3YzcyaVUvcEpzWGVCenZKT25Wak5wZ04rVFUzdktpMEthZ2w2?=
 =?utf-8?B?cWVIaXZsNDNiRS9DeFdORzdTakVhbVhVTkpKcG9YYi9KYXNyZGNlN2ZlLytk?=
 =?utf-8?B?YlhOYjRRLytEN21xZ2pkNFE5eXF3Vi9xanlDWlF6NURTbHorUC9ZSi9rcHpo?=
 =?utf-8?B?UlJoS1hvTjRqTm9xNGVvdElMNDZySDIxRzhsaUQwSGZzbVcrRkxoUGhtU1Zs?=
 =?utf-8?B?MFlNVEtTNGZLNCt1WGhiS1MyWnJRYzMzb3orbWhURktDNHBoTERpREZMWXow?=
 =?utf-8?B?VXVqSHpPZ2NRMi9hNUplNmUvVXBNaXBFWmgwUmhtWEZVekJBOEEwWVdXQWdM?=
 =?utf-8?B?T0FuZ2xzTjZFTWdTbHpQQ0F1OXk4VnhMSzlka0JRcVcwbEE0cjNGc3dvNmZx?=
 =?utf-8?B?T3phd2E4ckh6QldpRHhwSmhuUzZTRnhBTE5UTFhTRHpib25raTFaY1luYzkw?=
 =?utf-8?B?VW1BVnNsbFpiekdqNnU0Z2trMTZ6RHFLeElGM0JBWHY3VXR2U2daaG1iYUNZ?=
 =?utf-8?B?QmlOeVp0Rk5SSjQ0Qk9iRXJTWTY1a0hWUElaTDg3NC9iZFFvSXVlcTZwZlJU?=
 =?utf-8?B?b0RmaFIxYzRhY1kyNlF6RGJFTDU1NFVkSE1oeDNqbmNJb3ZWcWRMa0hud0kw?=
 =?utf-8?B?bDNXTFFnZG5JU3J2SVRqbVMwaDh1dEFsdVM2ZUVOYy9aTTQyWnlkcjVzcm5W?=
 =?utf-8?B?L09Bb2Z4cUZrbXd0UE44VytvS3pmcE5zWDY0MEhhOXpLWVdramhjcDBqZStD?=
 =?utf-8?B?MkJrdWVNVkVVcE5aTG5LdFVtdm5rNXduZ3BLb3dxNUt2UmJpTEhzQVpZWXlQ?=
 =?utf-8?B?SG5ySGJweGhhcDBCejdRWWFlNmdPY2NtbnlldVIwMUdob0UxYWNJRElkbmd2?=
 =?utf-8?B?cmlRbnB5RERFVkRYcHRUTzZId1ZxY2dsa3plRzZUS3pBWTlsSGt4eFFoalZV?=
 =?utf-8?B?czNuRk1YSXlHdVpQMVZVcUxWVk9HWHpQNC9sTjNCVURDaTdzOTBNbTBTQWtZ?=
 =?utf-8?B?bUJKYmthOEQ4WDVPZENIRFhyeDBGZ1h0Mnk4ejZpaERVVlF6dllOVHhlTFpR?=
 =?utf-8?B?ZjBhSmJtMG9Xc3hDRjd5QnR5VnlBeWoxSXRWcFQ1bTlEaUJSSC9zWjZpVG1X?=
 =?utf-8?B?UUF3RlVZSis4RzNzL043SmI3QXJNaGd2Z09NZDAvYk5SUEVPWFZhWllsQ0I5?=
 =?utf-8?B?YitYZ3UreWw3T2ttY1hJd2NXZE54UWU1QVFNcDJwUisvZExla3VaMVl4RzBH?=
 =?utf-8?B?eGhhL1hibVEvYXFpWG9hdjlmbmFvTDkxRnkwZkNlY2RmdHNlREorUU1MRTlB?=
 =?utf-8?B?YktiMVRuN2pJOGIzZmw5K3RxazlzWE9VZlhiZzYwZHNGTjIzK3RyVFlzMDQy?=
 =?utf-8?B?WmdVd3RNS0ZuTkZ1MHR2dFlrWmI1Nll0dWpocUQybjhhTGJLd0NRQTBuNkNR?=
 =?utf-8?B?VkR1cTZieUltcThLMEZmUWUybWtWd1hrY3B1bWpsOHpLK3JOa1Izc3QxcVU1?=
 =?utf-8?B?aDVhWVhyaThNS0RQQ0lybEM3RWJ2YlhsdWZsRXBiclE4L0V6RUFxTWxvTjZt?=
 =?utf-8?B?Q2MvTUJrWkg3dmNnYUowazVUUGE0a2sxdnQ1UkdzT0pHeEFIQkxvN3hKQ2xK?=
 =?utf-8?B?NFVNSnlHNCs3WnlEYnZOYkVrL0RieC9GV1MxSlRjR3Y3OS9QZ0ozUW9SRENS?=
 =?utf-8?B?L0tjQ0NFUVIwUFlYcTNkUW9takhrMEtBM0VPNitBYy9rRHkwODR6OW9mQWk1?=
 =?utf-8?B?cEtMM3JBTjkvRmQyUXlFUWlyQThiY0J4N3VmOU5sRXlobGd6MThyVTlLenQx?=
 =?utf-8?B?UVE2NnZmNjNwWSs3VEFwb3dONFJRQjgzajUxZnh4dEFZbXFCSUdqTEZsNld3?=
 =?utf-8?B?TzByayt4SDdDdXM5cHdUM3ExRHJrYkJhUHFoVWxCRi8vQjN0OG9uaEc4T2cr?=
 =?utf-8?B?MWtiWGtkb1Q4VVIrOVE0OXVtWDBoK0xMeGNRQ2lYKzJtUDFCZG5KS1d4bU1h?=
 =?utf-8?B?elhqWWNoNkpKaGFDOThjMlF5aG1QeTZVaU9TS0hwbDB5U3pWZ2s1SHl0ZnJ6?=
 =?utf-8?Q?eFQ1YAts6gWrrxfVDmJ5NuQ5A?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7fdd4d5-da3e-4d26-8d83-08db667f08f1
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 11:13:20.6725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sN2O7O3bdz3vykTdrGbIJN8+he+i3Fdg+Mx+dkbLBZhyGcKSpBPo7MFbmIh91OO1jpK9p/iC/YmN3PA870A5rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB3912
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/6 14:43, Chao Yu wrote: > On 2023/5/31 22:40,
 Yangtao
 Li wrote: >> This adds the async buffered write support to f2fs,
 >> the following
 is the relevant test data. > > Yangtao, > > Could you please provide detailed
 test comma [...] 
 Content analysis details:   (1.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.91 listed in list.dnswl.org]
 1.3 RCVD_IN_VALIDITY_RPBL  RBL: Relay in Validity RPBL,
 https://senderscore.org/blocklistlookup/
 [40.107.215.91 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.91 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1q6Ud2-0003yj-G0
Subject: Re: [f2fs-dev] [PATCH] f2fs: enable nowait async buffered writes
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
Cc: linux-kernel@vger.kernel.org, Lu Hongfei <luhongfei@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMy82LzYgMTQ6NDMsIENoYW8gWXUgd3JvdGU6Cgo+IE9uIDIwMjMvNS8zMSAyMjo0MCwg
WWFuZ3RhbyBMaSB3cm90ZToKPj4gVGhpcyBhZGRzIHRoZSBhc3luYyBidWZmZXJlZCB3cml0ZSBz
dXBwb3J0IHRvIGYyZnMsCj4+IHRoZSBmb2xsb3dpbmcgaXMgdGhlIHJlbGV2YW50IHRlc3QgZGF0
YS4KPgo+IFlhbmd0YW8sCj4KPiBDb3VsZCB5b3UgcGxlYXNlIHByb3ZpZGUgZGV0YWlsZWQgdGVz
dCBjb21tYW5kPwoKClVzZSBmaW8gdG8gdGVzdCwgdGhlIGZvbGxvd2luZyBpcyB0aGUgY29uZmln
dXJhdGlvbjoKCiMgaW9fdXJpbmcKW2dsb2JhbF0KaW9lbmdpbmU9aW9fdXJpbmcKc3F0aHJlYWRf
cG9sbD0xCnRocmVhZHM9MQppb2RlcHRoPTMyCmhpcHJpPTAKZGlyZWN0PTAKZml4ZWRidWZzPTAK
dW5jYWNoZWQ9MApub3dhaXQ9MApmb3JjZV9hc3luYz0wCnJhbmRyZXBlYXQ9MAp0aW1lX2Jhc2Vk
PTAKc2l6ZT0yNTZNCmZpbGVuYW1lPS9kYXRhL3Rlc3QvbG9jYWwvaW9fdXJpbmdfdGVzdApncm91
cF9yZXBvcnRpbmcKW3JlYWQyNTZCLXJhbmRdCmJzPTQwOTYKcnc9cmFuZHdyaXRlCm51bWpvYnM9
MQoKCj4KPiBUaGFua3MsCj4KPj4KPj4gaW9kZXB0aMKgwqDCoMKgwqAgfCAxwqDCoMKgIHwgMsKg
wqDCoCB8IDTCoMKgwqAgfCA4wqDCoMKgIHwgMTbCoMKgIHwKPj4gYmVmb3JlKE0vcynCoCB8IDEw
MTIgfCAxMTMzIHwgODk0wqAgfCA5ODHCoCB8IDg2NsKgIHwKPj4gYWZ0ZXIoTS9zKcKgwqAgfCAx
NDg4IHwgMTg5NiB8IDIwODEgfCAyMTg4IHwgMjIwNyB8Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEx1
IEhvbmdmZWkgPGx1aG9uZ2ZlaUB2aXZvLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogWWFuZ3RhbyBM
aSA8ZnJhbmsubGlAdml2by5jb20+Cj4+IC0tLQo+PiDCoCBmcy9mMmZzL2ZpbGUuYyB8IDUgKy0t
LS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA0IGRlbGV0aW9ucygtKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9maWxlLmMgYi9mcy9mMmZzL2ZpbGUuYwo+PiBpbmRl
eCAyM2M2OGVlOTQ2ZTUuLjRmYWYyYzA0ZTMyNSAxMDA2NDQKPj4gLS0tIGEvZnMvZjJmcy9maWxl
LmMKPj4gKysrIGIvZnMvZjJmcy9maWxlLmMKPj4gQEAgLTU0Niw3ICs1NDYsNyBAQCBzdGF0aWMg
aW50IGYyZnNfZmlsZV9vcGVuKHN0cnVjdCBpbm9kZSAqaW5vZGUsIAo+PiBzdHJ1Y3QgZmlsZSAq
ZmlscCkKPj4gwqDCoMKgwqDCoCBpZiAoZXJyKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IGVycjsKPj4gwqAgLcKgwqDCoCBmaWxwLT5mX21vZGUgfD0gRk1PREVfTk9XQUlUIHwgRk1PREVf
QlVGX1JBU1lOQzsKPj4gK8KgwqDCoCBmaWxwLT5mX21vZGUgfD0gRk1PREVfTk9XQUlUIHwgRk1P
REVfQlVGX1JBU1lOQyB8IEZNT0RFX0JVRl9XQVNZTkM7Cj4+IMKgIMKgwqDCoMKgwqAgcmV0dXJu
IGRxdW90X2ZpbGVfb3Blbihpbm9kZSwgZmlscCk7Cj4+IMKgIH0KPj4gQEAgLTQ1MTUsOSArNDUx
NSw2IEBAIHN0YXRpYyBzc2l6ZV90IGYyZnNfYnVmZmVyZWRfd3JpdGVfaXRlcihzdHJ1Y3QgCj4+
IGtpb2NiICppb2NiLAo+PiDCoMKgwqDCoMKgIHN0cnVjdCBpbm9kZSAqaW5vZGUgPSBmaWxlX2lu
b2RlKGZpbGUpOwo+PiDCoMKgwqDCoMKgIHNzaXplX3QgcmV0Owo+PiDCoCAtwqDCoMKgIGlmIChp
b2NiLT5raV9mbGFncyAmIElPQ0JfTk9XQUlUKQo+PiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1F
T1BOT1RTVVBQOwo+PiAtCj4+IMKgwqDCoMKgwqAgY3VycmVudC0+YmFja2luZ19kZXZfaW5mbyA9
IGlub2RlX3RvX2JkaShpbm9kZSk7Cj4+IMKgwqDCoMKgwqAgcmV0ID0gZ2VuZXJpY19wZXJmb3Jt
X3dyaXRlKGlvY2IsIGZyb20pOwo+PiDCoMKgwqDCoMKgIGN1cnJlbnQtPmJhY2tpbmdfZGV2X2lu
Zm8gPSBOVUxMOwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwK
