Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA5F72F90C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Jun 2023 11:27:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q9Mmn-00008B-7b;
	Wed, 14 Jun 2023 09:27:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1q9Mml-000083-UZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jun 2023 09:27:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WQ9M+L3xXiQVpA1bq9nkAoakBZPfgptvsMEarc7Lqr0=; b=DqsAc/4qkoBS3elxJQCmzDyR4B
 e0NSNRAjs2Y1L/PLLssL5ZL+Ne2syDZNfbnoynVw5CRKmoBsCT4sPWS9W2b2LnJbH6RttK8dwc9IA
 GR76UM5PT7QiFAo82UtdeE6dHHP6vIzuT5nxjYMRKNND8Vhb9e91PScus8BSDBfVPNY0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WQ9M+L3xXiQVpA1bq9nkAoakBZPfgptvsMEarc7Lqr0=; b=FGJPWqMI2v07h2boiW3bm9J+uc
 xhRSaxqWny7dWyslJVXEo39PwX8EAM9bgMrzRJAgIEsFpfa8WaSyTqtqS2BnkW6uAhMeUruc+rv9k
 Eef8Bga090+goFCBqeZedYYFhcPS9Eg3NQlc5/7LQDqdmxKLEKB0BCqPKhghEvGyIHGk=;
Received: from mail-tyzapc01on2112.outbound.protection.outlook.com
 ([40.107.117.112] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q9Mmf-002n2e-SF for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jun 2023 09:27:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X7x/D8+RKgbtakJ2NS5ZN+SLNbbw0gVsAzWjZUAkrojz2O8RwMg7VnkFKUMsLc7ysYWXeTtm9+uQb9R+OQHtnkfZKbC5eLHiUBCAq8BJIgm7r/K64zb2TSC4mNpxgb036nwMADNmyeRA4uuO/RwCAevQZLXXUItxxuIcjL73oEV2DapAZugNF3F6czcC+l5Ugc+nEUFTUDktwS7CShiDOdbuGNONlEHGS/yDSp32/nfyxZGUrkxGKRGky/SB3t/EiDWMvfNRYevFZb0FqI/F7UL27+2KmfkIb/mSYceBIoXP/1/0XxJf1GDrc4xDOIIq0uxBCU/2ZVloR5CZrrVKVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQ9M+L3xXiQVpA1bq9nkAoakBZPfgptvsMEarc7Lqr0=;
 b=LREeOqt0Af0QNb9GdkI6UdoAGEASI/lkeYJL/IUqb1SCqX91tkZTf7KO8ituOPmBsxc2iarvJKgGg5E554gMo+UPF00m+ZIJw7F5KMk4A0KVPjzM6C0BkKh/lJBWWvKCEE0+M79381RgPlXvrAq9Wjy2sQpq/vthhnF/FBgoSs8Fp9WbwCHDeaDQloJB0v7lTSJhIHpM0dzaFOZwPkMZmd8vnc+VNzHRswEyjAaBRtx4wMpyv7hxxDA7gxPW3UlIKzSvGWsZF3vfwf/ibbcTOz16alR4YsJr9s+rR/7uuqhdK1PqJWnduKyO2oPPn5sU0iowFHS3LWmlA8ETMF2/4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQ9M+L3xXiQVpA1bq9nkAoakBZPfgptvsMEarc7Lqr0=;
 b=f6brCYdz/ri9ngi4mYBW7LljAnUziBgd4TDQUS34yxIPx2riit5VCz9ylsAW4q7S5lEJ9ii47Z1jGOQHrTZ746H1mYoAvpwDtMkx7i1X0EKbZreWCJQy6ufKtjV20sAIqEaufpmUuzGKSSCby0ohndV25BnEdmolCDz9OU24X+xSLnBBZAnwb/kIwl9fHK9BegOm3lSYnrqZFfHVhQHPZfVmUz+0JrcODUMYzOw8Q8QXyJ+Y24k53yTIPXClXnbdbG5rdEHmAiKFJNbuyY+Olzr9SUu0wmopCHU5z9YW02w+RC0cLlmRJjeY0pe2tVyIg/j0VwErWft4jBWQQ9tAew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com (2603:1096:404:fb::23)
 by JH0PR06MB6799.apcprd06.prod.outlook.com (2603:1096:990:3a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.31; Wed, 14 Jun
 2023 09:27:08 +0000
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::e008:38cc:5ce6:769a]) by TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::e008:38cc:5ce6:769a%3]) with mapi id 15.20.6455.043; Wed, 14 Jun 2023
 09:27:07 +0000
Message-ID: <12df63c7-71b3-3223-b9fa-0dff6c1d6d14@vivo.com>
Date: Wed, 14 Jun 2023 17:27:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <20230524024204.13694-1-guochunhai@vivo.com>
In-Reply-To: <20230524024204.13694-1-guochunhai@vivo.com>
X-ClientProxiedBy: SI2P153CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::10) To TY2PR06MB3342.apcprd06.prod.outlook.com
 (2603:1096:404:fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR06MB3342:EE_|JH0PR06MB6799:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c613d43-dd8f-4ab7-9a9d-08db6cb985e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U02D1+3cZ55QdNDpRceKkEYkTFFZQ0V/Obw8NNEUa4eKYQqIesv++VY7F0eL8ZVSRp67PKn1HjRQV6r7NJ44END8cliFeH7AQJGSr4XK3ii3BnQxuX89jBYmMyy1jFWXzz/VLZD+4qiBm3paXUe27iLMfsY1LGqosa4zLmYxyT6PHEgk76LqTX4OgX4MOPQnd+UtnPYgjjLY+mi+19GQ7rYfhdk1y/JxBTi0wii8Yk3ZOtaA7AX4vBBp/roGdX/rIhilD97HKrQhAark/+xRy+XjFkYBEbRnGULRvl2zJ7Lcy972yY7Ip8pB0LCejUksi3bu8qobVZFP6NFEzQ2QJk4pQb9LUHU5t6tTX5MqDy1fldtjft9fy1bZLayWrGbq2dvHOtX0QM4e0vUw6KeuTibwm9Z7HAA8ORzKHYwx0GbOLx8hzKQPo2rUIk+BgkNN+mvGSr8Dezgpcz76oA1v5kivljAYyvJ3kcPAcpC12o2iFX3eJErwdZa0MJPCK/YJB61xXg2gmbvUMdlTOxVsM/YImIM8f9MBXixTQPpixjUZA8rjN4WceR8trJrhuoZW4SWyuCW0qGkhoiCks83ZWti6dZDpIg0xPbLpbUCszfQOwJceBNJkqvleq8njqKBYz1MLJ1/Ti63BaEnrS9fGmQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR06MB3342.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(39860400002)(396003)(366004)(346002)(451199021)(41300700001)(66946007)(66556008)(86362001)(8936002)(8676002)(6916009)(4326008)(6666004)(316002)(6486002)(66476007)(5660300002)(31686004)(6506007)(6512007)(26005)(31696002)(186003)(54906003)(53546011)(478600001)(2616005)(83380400001)(2906002)(36756003)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VldUdnkvVzNsdUkzYmNIYXRtQzNWZHh4NHVmQjl6NW81NjJqMitSZm1CUkYy?=
 =?utf-8?B?RlkyOEI5bXRIZFBLakY4NDB3OW0reCtFbU5PWnRlK1ZEd3R0VUNORFFVaWs0?=
 =?utf-8?B?R1A2b2VYNUxTaVhSOWgwV1FsYTVEdVVLajlpWDd1K3p2QmJlMi9HbU0xMU5r?=
 =?utf-8?B?VC80VHIwMytTaXBWUEQwUVdTVDNHSjFoakpZZkZxTXlOWkZ1b0tFMnJjY2Qz?=
 =?utf-8?B?ci8rUUxOcERTRm0xWGNTTXN4Vno5bFA0cUF5TkNUQTNzRHhpZHc1Q2FqdGdS?=
 =?utf-8?B?clRJQW5jU1BaN0JKNTFQYTVZZHRBMmxqdFh5T0VIRVQ1K0NJeE01aUJ1anhX?=
 =?utf-8?B?blFkVmRSM2pvUGxIa0ptWHRCY2U2YUlMZFZISVpjeDk3KzNGdVdyY3pNWnFx?=
 =?utf-8?B?ZjA2eXVQdndzQmVJNGlTZVY4QTNNazYzc1dvaXZWbFhkT2x1cGZPaytFQ2ZP?=
 =?utf-8?B?ZVVqSzRKajRXek5CaG1lWStua3VqdUJJc3g5K1RSa2J6UzhQZmx2RUMzSlZo?=
 =?utf-8?B?TVVZYWpJODVLWnR6WDVRYTJRNnpMVlZ0ajVEZVByV1JBZzhEZFo3N05jYVVn?=
 =?utf-8?B?K21oTWpmMzRMZmpNUGZUMVdESWJWSmJlRE9mZ0k3ZFJtbWpSajFFa2hvelRC?=
 =?utf-8?B?aXhYcmwyZ0NENlFPMENLVlJpSWpvelBCazgyeFpxY29zQkJPKzhjc1ZkOFZi?=
 =?utf-8?B?b1NCSDhSVWNKenNYOWZiT0JjTWFnK2xzQzlBSmJqVEtsVDZsL2d4S2pycHF1?=
 =?utf-8?B?bzkrV2RGakYySFhhTitZaGd6bFhraHV5ZUVqVjI5SE9La2Z3Q090QjU4dGZV?=
 =?utf-8?B?bzNsWndMQjRIVlFHYmQ2TzRpNktHSm1WYzRmSzBYK0pGWndmOWozOG5TR0Zp?=
 =?utf-8?B?L0tzYkpZc0NXVmppMmdMblk0SnJxMGJWUkFoS2lMMzYrZ3RuVzViMU1SWUwx?=
 =?utf-8?B?R2ljcUUwQVZnTFZOVnh2eGhSenl3aG1DNWdrRDREc1k0LzZjb0EyYU52ZEY0?=
 =?utf-8?B?WEVJSlN2VWY0Unk5Zy9laDVVd0dkUXRpamszTEwxVXU1T0VRUjlieFowTGVu?=
 =?utf-8?B?Y21JM3loS1o0STB3clJqT0NFa05xa0htK1hXTlVuaHNGUGRkNjNtWTBGQTF3?=
 =?utf-8?B?NkFncEEwbXFTSS83aGc2ZVBkejd0aG0ySFdYOGErREl4R0lLMjdtaklyQ0tw?=
 =?utf-8?B?VkRuSElKRHA1VUlvNDZ6R1dmbXZmRS9nbFplOGs5a3pwV0kvUUtiVEg0L2JE?=
 =?utf-8?B?cENTbDVEb0hITHlFY3YrVmRpRnVMYWZOMDQvbXNpaUpVWWE2SHpKK0M0K0lW?=
 =?utf-8?B?eUJUTFVwR29aRG9TNFAvRkJsbDYxeDNPYXZvcy9UM2xWNXJ1RTlpSzN0a3hy?=
 =?utf-8?B?c3NhV3ZiQXFJNEJYZ1dHbzdLOUwxa0IzTGxUa1VsREJRNkNCWXVxdDJWQXlu?=
 =?utf-8?B?MjBncXBmVkFFTzlEcUdaVFMzU1o1RlFaaE12RCsrUkFHZWZSSWRNa1VuZFg3?=
 =?utf-8?B?bnNSMVArSVBScFRLUzdsMUdKS21FQitoSFZRNkE3K1FlOERteStaNXNRbUor?=
 =?utf-8?B?OGlyaVY2cFZhSzNQdGxsWlI2cmhtYUlGQ2pDMk9Nbjk5Rk5odGlXbVc0TXBl?=
 =?utf-8?B?RlhrM3ovRTV2dkVjZ3RiOTJmYklRZ21Fb1hJTXZPeUJ1UzhFSEJBSk9VZnBL?=
 =?utf-8?B?a2YxbFppUS9GYnlVb205NGk2WVEyTEdOK0ROQm1jSTVzTDIwOG5jL2NPRGFt?=
 =?utf-8?B?YnNIS2w5ZVJwYkxIWDVvcTVYWmJNNTNROEZmRlJTQzdNRCswZHVuczE1R3FC?=
 =?utf-8?B?a2tzSE9LMTkxOXIvZmJmOGhDaStEaWUxTHBKSG5UUEdmZlZpdmxhTGpqeTlp?=
 =?utf-8?B?cVUra1lLRVFlVjErOXVheE9vNUh2YkVOM2czZE15emY2Rzg2RW9qZ3k4cjRr?=
 =?utf-8?B?UlhoK1lLN2dtU2d4VDFoS0VMc0t2cnZNMndmbUpiRXFsNzU0dnF6VGx1b2Er?=
 =?utf-8?B?b0haOHBpMGtrSHBPYys3VTA3ejl4dDdBMTlnNFMyM1ZZZ0cyZVdVa1FJOGZI?=
 =?utf-8?B?UG9DTHB2Ykt2d0R4TElyOHFIZzBMWjNRWTNZMWUxb2FjckN3Z1hpYUgvTjRD?=
 =?utf-8?Q?Pm/504jI1ZLqayItfuAep3g7s?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c613d43-dd8f-4ab7-9a9d-08db6cb985e6
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB3342.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 09:27:07.7068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mmozJMMQLSRs4woJabLwMrDSlWFGmR98UqoXJV1MaiEpFL3UK5zBOc0mxTHmUzQSfxq5Jl4TfPmJm2Ip5O1xPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6799
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Jaegeuk, Could you please help to confirm if this patch
 has been merged? I cannot see the patch in the dev-test or dev branch. Thanks.
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.112 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.112 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1q9Mmf-002n2e-SF
Subject: Re: [f2fs-dev] [PATCH v8] fsck.f2fs: Detect and fix looped node
 chain efficiently
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
 <linux-f2fs-devel@lists.sourceforge.net>,
 =?UTF-8?B?5p2O5oms6Z+s?= <frank.li@vivo.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgSmFlZ2V1aywKCkNvdWxkIHlvdSBwbGVhc2UgaGVscCB0byBjb25maXJtIGlmIHRoaXMgcGF0
Y2ggaGFzIGJlZW4gbWVyZ2VkPyBJIGNhbm5vdCAKc2VlIHRoZSBwYXRjaCBpbiB0aGUgZGV2LXRl
c3Qgb3IgZGV2IGJyYW5jaC4KClRoYW5rcy4KCk9uIDIwMjMvNS8yNCAxMDo0Miwg6YOt57qv5rW3
IHdyb3RlOgo+IGZpbmRfZnN5bmNfaW5vZGUoKSBkZXRlY3QgdGhlIGxvb3BlZCBub2RlIGNoYWlu
IGJ5IGNvbXBhcmluZyB0aGUgbG9vcAo+IGNvdW50ZXIgd2l0aCBmcmVlIGJsb2Nrcy4gV2hpbGUg
aXQgbWF5IHRha2UgdGVucyBvZiBzZWNvbmRzIHRvIHF1aXQgd2hlbgo+IHRoZSBmcmVlIGJsb2Nr
cyBhcmUgbGFyZ2UgZW5vdWdoLiBXZSBjYW4gdXNlIEZsb3lkJ3MgY3ljbGUgZGV0ZWN0aW9uCj4g
YWxnb3JpdGhtIHRvIG1ha2UgdGhlIGRldGVjdGlvbiBtb3JlIGVmZmljaWVudCwgYW5kIGZpeCB0
aGUgaXNzdWUgYnkKPiBmaWxsaW5nIGEgTlVMTCBhZGRyZXNzIGluIHRoZSBsYXN0IG5vZGUgb2Yg
dGhlIGNoYWluLgo+IAo+IEJlbG93IGlzIHRoZSBsb2cgd2UgZW5jb3VudGVyIG9uIGEgMjU2R0Ig
VUZTIHN0b3JhZ2UgYW5kIGl0IHRha2VzIGFib3V0Cj4gMjUgc2Vjb25kcyB0byBkZXRlY3QgbG9v
cGVkIG5vZGUgY2hhaW4uIEFmdGVyIGNoYW5naW5nIHRoZSBhbGdvcml0aG0sIGl0Cj4gdGFrZXMg
YWJvdXQgMjBtcyB0byBmaW5pc2ggdGhlIHNhbWUgam9iLgo+IAo+ICAgICAgWyAgIDEwLjgyMjkw
NF0gZnNjay5mMmZzOiBJbmZvOiB2ZXJzaW9uIHRpbWVzdGFtcCBjdXI6IDE3LCBwcmV2OiA0MzAK
PiAgICAgIFsgICAxMC44MjI5NDldIGZzY2suZjJmczogW3VwZGF0ZV9zdXBlcmJsb2NrOiA3NjJd
IEluZm86IERvbmUgdG8KPiB1cGRhdGUgc3VwZXJibG9jawo+ICAgICAgWyAgIDEwLjgyMjk1M10g
ZnNjay5mMmZzOiBJbmZvOiBzdXBlcmJsb2NrIGZlYXR1cmVzID0gMTQ5OSA6Cj4gZW5jcnlwdCB2
ZXJpdHkgZXh0cmFfYXR0ciBwcm9qZWN0X3F1b3RhIHF1b3RhX2lubyBjYXNlZm9sZAo+ICAgICAg
WyAgIDEwLjgyMjk1Nl0gZnNjay5mMmZzOiBJbmZvOiBzdXBlcmJsb2NrIGVuY3J5cHQgbGV2ZWwg
PSAwLCBzYWx0ID0KPiAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMAo+ICAgICAgWyAg
IDEwLjgyMjk2MF0gZnNjay5mMmZzOiBJbmZvOiB0b3RhbCBGUyBzZWN0b3JzID0gNTkyNDk4MTEg
KDIzMTQ0NAo+IE1CKQo+ICAgICAgWyAgIDM1Ljg1MjgyN10gZnNjay5mMmZzOglkZXRlY3QgbG9v
cGVkIG5vZGUgY2hhaW4sCj4gYmxrYWRkcjoxMTE0ODAyLCBuZXh0OjExMTQ4MDMKPiAgICAgIFsg
ICAzNS44NTI4NDJdIGZzY2suZjJmczogW2YyZnNfZG9fbW91bnQ6Mzg0Nl0gcmVjb3JkX2ZzeW5j
X2RhdGEKPiBmYWlsZWQKPiAgICAgIFsgICAzNS44NTYxMDZdIGZzY2suZjJmczogZnNjay5mMmZz
IHRlcm1pbmF0ZWQgYnkgZXhpdCgyNTUpCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2h1bmhhaSBHdW8g
PGd1b2NodW5oYWlAdml2by5jb20+Cj4gLS0tCj4gdjcgLT4gdjggOiBSZWZvcm1hdCB0aGUgY29k
ZSB0byByZWR1Y2UgaW5kZW50aW9uLgo+IHY2IC0+IHY3IDogQ29ycmVjdCBsb2dpYyBlcnJvciB0
byBoYW5kbGUgaXNfZGV0ZWN0aW5nIHJldHVybiBieQo+IAlmaW5kX25vZGVfYmxrX2Zhc3QoKS4K
PiB2NSAtPiB2NiA6IFNpbXBsaWZ5IHRoZSBjb2RlIGJ5IHJlbW92aW5nIHVubmVjZXNzYXJ5IHJl
dHJ5IGxvZ2ljLgo+IHY0IC0+IHY1IDogVXNlIElTX0lOT0RFKCkgdG8gbWFrZSB0aGUgY29kZSBt
b3JlIGNsZWFyLgo+IHYzIC0+IHY0IDogU2V0IGMuYnVnX29uIHdpdGggQVNTRVJUX01TRygpIHdo
ZW4gaXNzdWUgaXMgZGV0ZWN0ZWQgYW5kIGZpeAo+IAlpdCBvbmx5IGlmIGMuZml4X29uIGlzIDEu
Cj4gdjIgLT4gdjMgOiBXcml0ZSBpbm9kZSB3aXRoIHdyaXRlX2lub2RlKCkgdG8gYXZvaWQgY2hr
c3VtIGJlaW5nIGJyb2tlbi4KPiB2MSAtPiB2MiA6IEZpeCBsb29wZWQgbm9kZSBjaGFpbiBkaXJl
Y3RseSBhZnRlciBpdCBpcyBkZXRlY3RlZC4KPiAtLS0KPiAgIGZzY2svbW91bnQuYyB8IDEyNyAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAxMTIgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2ZzY2svbW91bnQuYyBiL2ZzY2svbW91bnQuYwo+IGluZGV4IDRjNzQ4ODg0MGM3
Yy4uOWQ2YTIyMmEwNTVjIDEwMDY0NAo+IC0tLSBhL2ZzY2svbW91bnQuYwo+ICsrKyBiL2ZzY2sv
bW91bnQuYwo+IEBAIC0zNTE4LDIyICszNTE4LDkwIEBAIHN0YXRpYyB2b2lkIGRlc3Ryb3lfZnN5
bmNfZG5vZGVzKHN0cnVjdCBsaXN0X2hlYWQgKmhlYWQpCj4gICAJCWRlbF9mc3luY19pbm9kZShl
bnRyeSk7Cj4gICB9Cj4gICAKPiArc3RhdGljIGludCBmaW5kX25vZGVfYmxrX2Zhc3Qoc3RydWN0
IGYyZnNfc2JfaW5mbyAqc2JpLCBibG9ja190ICpibGthZGRyX2Zhc3QsCj4gKwkJc3RydWN0IGYy
ZnNfbm9kZSAqbm9kZV9ibGtfZmFzdCwgYm9vbCAqaXNfZGV0ZWN0aW5nKQo+ICt7Cj4gKwlpbnQg
aSwgZXJyOwo+ICsKPiArCWZvciAoaSA9IDA7IGkgPCAyOyBpKyspIHsKPiArCQlpZiAoIWYyZnNf
aXNfdmFsaWRfYmxrYWRkcihzYmksICpibGthZGRyX2Zhc3QsIE1FVEFfUE9SKSkgewo+ICsJCQkq
aXNfZGV0ZWN0aW5nID0gZmFsc2U7Cj4gKwkJCXJldHVybiAwOwo+ICsJCX0KPiArCj4gKwkJZXJy
ID0gZGV2X3JlYWRfYmxvY2sobm9kZV9ibGtfZmFzdCwgKmJsa2FkZHJfZmFzdCk7Cj4gKwkJaWYg
KGVycikKPiArCQkJcmV0dXJuIGVycjsKPiArCj4gKwkJaWYgKCFpc19yZWNvdmVyYWJsZV9kbm9k
ZShzYmksIG5vZGVfYmxrX2Zhc3QpKSB7Cj4gKwkJCSppc19kZXRlY3RpbmcgPSBmYWxzZTsKPiAr
CQkJcmV0dXJuIDA7Cj4gKwkJfQo+ICsKPiArCQkqYmxrYWRkcl9mYXN0ID0gbmV4dF9ibGthZGRy
X29mX25vZGUobm9kZV9ibGtfZmFzdCk7Cj4gKwl9Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gK30KPiAr
Cj4gK3N0YXRpYyBpbnQgbG9vcF9ub2RlX2NoYWluX2ZpeChzdHJ1Y3QgZjJmc19zYl9pbmZvICpz
YmksCj4gKwkJYmxvY2tfdCBibGthZGRyX2Zhc3QsIHN0cnVjdCBmMmZzX25vZGUgKm5vZGVfYmxr
X2Zhc3QsCj4gKwkJYmxvY2tfdCBibGthZGRyLCBzdHJ1Y3QgZjJmc19ub2RlICpub2RlX2JsaykK
PiArewo+ICsJYmxvY2tfdCBibGthZGRyX2VudHJ5LCBibGthZGRyX3RtcDsKPiArCWludCBlcnI7
Cj4gKwo+ICsJLyogZmluZCB0aGUgZW50cnkgcG9pbnQgb2YgdGhlIGxvb3BlZCBub2RlIGNoYWlu
ICovCj4gKwl3aGlsZSAoYmxrYWRkcl9mYXN0ICE9IGJsa2FkZHIpIHsKPiArCQllcnIgPSBkZXZf
cmVhZF9ibG9jayhub2RlX2Jsa19mYXN0LCBibGthZGRyX2Zhc3QpOwo+ICsJCWlmIChlcnIpCj4g
KwkJCXJldHVybiBlcnI7Cj4gKwkJYmxrYWRkcl9mYXN0ID0gbmV4dF9ibGthZGRyX29mX25vZGUo
bm9kZV9ibGtfZmFzdCk7Cj4gKwo+ICsJCWVyciA9IGRldl9yZWFkX2Jsb2NrKG5vZGVfYmxrLCBi
bGthZGRyKTsKPiArCQlpZiAoZXJyKQo+ICsJCQlyZXR1cm4gZXJyOwo+ICsJCWJsa2FkZHIgPSBu
ZXh0X2Jsa2FkZHJfb2Zfbm9kZShub2RlX2Jsayk7Cj4gKwl9Cj4gKwlibGthZGRyX2VudHJ5ID0g
YmxrYWRkcjsKPiArCj4gKwkvKiBmaW5kIHRoZSBsYXN0IG5vZGUgb2YgdGhlIGNoYWluICovCj4g
KwlkbyB7Cj4gKwkJYmxrYWRkcl90bXAgPSBibGthZGRyOwo+ICsJCWVyciA9IGRldl9yZWFkX2Js
b2NrKG5vZGVfYmxrLCBibGthZGRyKTsKPiArCQlpZiAoZXJyKQo+ICsJCQlyZXR1cm4gZXJyOwo+
ICsJCWJsa2FkZHIgPSBuZXh0X2Jsa2FkZHJfb2Zfbm9kZShub2RlX2Jsayk7Cj4gKwl9IHdoaWxl
IChibGthZGRyICE9IGJsa2FkZHJfZW50cnkpOwo+ICsKPiArCS8qIGZpeCB0aGUgYmxrYWRkciBv
ZiBsYXN0IG5vZGUgd2l0aCBOVUxMX0FERFIuICovCj4gKwlub2RlX2Jsay0+Zm9vdGVyLm5leHRf
YmxrYWRkciA9IE5VTExfQUREUjsKPiArCWlmIChJU19JTk9ERShub2RlX2JsaykpCj4gKwkJZXJy
ID0gd3JpdGVfaW5vZGUobm9kZV9ibGssIGJsa2FkZHJfdG1wKTsKPiArCWVsc2UKPiArCQllcnIg
PSBkZXZfd3JpdGVfYmxvY2sobm9kZV9ibGssIGJsa2FkZHJfdG1wKTsKPiArCWlmICghZXJyKQo+
ICsJCUZJWF9NU0coIkZpeCBsb29wZWQgbm9kZSBjaGFpbiBvbiBibGthZGRyICV1XG4iLAo+ICsJ
CQkJYmxrYWRkcl90bXApOwo+ICsJcmV0dXJuIGVycjsKPiArfQo+ICsKPiAgIHN0YXRpYyBpbnQg
ZmluZF9mc3luY19pbm9kZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBsaXN0X2hl
YWQgKmhlYWQpCj4gICB7Cj4gICAJc3RydWN0IGN1cnNlZ19pbmZvICpjdXJzZWc7Cj4gLQlzdHJ1
Y3QgZjJmc19ub2RlICpub2RlX2JsazsKPiAtCWJsb2NrX3QgYmxrYWRkcjsKPiAtCXVuc2lnbmVk
IGludCBsb29wX2NudCA9IDA7Cj4gLQl1bnNpZ25lZCBpbnQgZnJlZV9ibG9ja3MgPSBNQUlOX1NF
R1Moc2JpKSAqIHNiaS0+YmxvY2tzX3Blcl9zZWcgLQo+IC0JCQkJCQlzYmktPnRvdGFsX3ZhbGlk
X2Jsb2NrX2NvdW50Owo+ICsJc3RydWN0IGYyZnNfbm9kZSAqbm9kZV9ibGssICpub2RlX2Jsa19m
YXN0Owo+ICsJYmxvY2tfdCBibGthZGRyLCBibGthZGRyX2Zhc3Q7Cj4gKwlib29sIGlzX2RldGVj
dGluZyA9IHRydWU7Cj4gICAJaW50IGVyciA9IDA7Cj4gICAKPiArCW5vZGVfYmxrID0gY2FsbG9j
KEYyRlNfQkxLU0laRSwgMSk7Cj4gKwlub2RlX2Jsa19mYXN0ID0gY2FsbG9jKEYyRlNfQkxLU0la
RSwgMSk7Cj4gKwlBU1NFUlQobm9kZV9ibGsgJiYgbm9kZV9ibGtfZmFzdCk7Cj4gKwo+ICAgCS8q
IGdldCBub2RlIHBhZ2VzIGluIHRoZSBjdXJyZW50IHNlZ21lbnQgKi8KPiAgIAljdXJzZWcgPSBD
VVJTRUdfSShzYmksIENVUlNFR19XQVJNX05PREUpOwo+ICAgCWJsa2FkZHIgPSBORVhUX0ZSRUVf
QkxLQUREUihzYmksIGN1cnNlZyk7Cj4gLQo+IC0Jbm9kZV9ibGsgPSBjYWxsb2MoRjJGU19CTEtT
SVpFLCAxKTsKPiAtCUFTU0VSVChub2RlX2Jsayk7Cj4gKwlibGthZGRyX2Zhc3QgPSBibGthZGRy
Owo+ICAgCj4gICAJd2hpbGUgKDEpIHsKPiAgIAkJc3RydWN0IGZzeW5jX2lub2RlX2VudHJ5ICpl
bnRyeTsKPiBAQCAtMzU2NCwxOSArMzYzMiw0OCBAQCBzdGF0aWMgaW50IGZpbmRfZnN5bmNfaW5v
ZGUoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3QgbGlzdF9oZWFkICpoZWFkKQo+ICAg
CQlpZiAoSVNfSU5PREUobm9kZV9ibGspICYmIGlzX2RlbnRfZG5vZGUobm9kZV9ibGspKQo+ICAg
CQkJZW50cnktPmxhc3RfZGVudHJ5ID0gYmxrYWRkcjsKPiAgIG5leHQ6Cj4gLQkJLyogc2FuaXR5
IGNoZWNrIGluIG9yZGVyIHRvIGRldGVjdCBsb29wZWQgbm9kZSBjaGFpbiAqLwo+IC0JCWlmICgr
K2xvb3BfY250ID49IGZyZWVfYmxvY2tzIHx8Cj4gLQkJCWJsa2FkZHIgPT0gbmV4dF9ibGthZGRy
X29mX25vZGUobm9kZV9ibGspKSB7Cj4gLQkJCU1TRygwLCAiXHRkZXRlY3QgbG9vcGVkIG5vZGUg
Y2hhaW4sIGJsa2FkZHI6JXUsIG5leHQ6JXVcbiIsCj4gLQkJCQkgICAgYmxrYWRkciwKPiAtCQkJ
CSAgICBuZXh0X2Jsa2FkZHJfb2Zfbm9kZShub2RlX2JsaykpOwo+ICsJCWJsa2FkZHIgPSBuZXh0
X2Jsa2FkZHJfb2Zfbm9kZShub2RlX2Jsayk7Cj4gKwo+ICsJCS8qIEJlbG93IHdlIHdpbGwgZGV0
ZWN0IGxvb3BlZCBub2RlIGNoYWluIHdpdGggRmxveWQncyBjeWNsZQo+ICsJCSAqIGRldGVjdGlv
biBhbGdvcml0aG0uCj4gKwkJICovCj4gKwkJaWYgKCFpc19kZXRlY3RpbmcpCj4gKwkJCWNvbnRp
bnVlOwo+ICsKPiArCQllcnIgPSBmaW5kX25vZGVfYmxrX2Zhc3Qoc2JpLCAmYmxrYWRkcl9mYXN0
LAo+ICsJCQkJbm9kZV9ibGtfZmFzdCwgJmlzX2RldGVjdGluZyk7Cj4gKwkJaWYgKGVycikKPiAr
CQkJYnJlYWs7Cj4gKwo+ICsJCWlmICghaXNfZGV0ZWN0aW5nKQo+ICsJCQljb250aW51ZTsKPiAr
Cj4gKwkJaWYgKGJsa2FkZHJfZmFzdCAhPSBibGthZGRyKQo+ICsJCQljb250aW51ZTsKPiArCj4g
KwkJQVNTRVJUX01TRygiXHRkZXRlY3QgbG9vcGVkIG5vZGUgY2hhaW4sIGJsa2FkZHI6JXVcbiIs
Cj4gKwkJCQlibGthZGRyKTsKPiArCj4gKwkJaWYgKCFjLmZpeF9vbikgewo+ICAgCQkJZXJyID0g
LTE7Cj4gICAJCQlicmVhazsKPiAgIAkJfQo+ICAgCj4gLQkJYmxrYWRkciA9IG5leHRfYmxrYWRk
cl9vZl9ub2RlKG5vZGVfYmxrKTsKPiArCQllcnIgPSBsb29wX25vZGVfY2hhaW5fZml4KHNiaSwK
PiArCQkJCU5FWFRfRlJFRV9CTEtBRERSKHNiaSwgY3Vyc2VnKSwKPiArCQkJCW5vZGVfYmxrX2Zh
c3QsIGJsa2FkZHIsIG5vZGVfYmxrKTsKPiArCQlpZiAoZXJyKQo+ICsJCQlicmVhazsKPiArCj4g
KwkJLyogU2luY2Ugd2UgY2FsbCBnZXRfZnN5bmNfaW5vZGUoKSB0byBlbnN1cmUgdGhlcmUgYXJl
IG5vCj4gKwkJICogZHVwbGljYXRlIGlub2RlcyBpbiB0aGUgaW5vZGVfbGlzdCBldmVuIGlmIHRo
ZXJlIGFyZQo+ICsJCSAqIGR1cGxpY2F0ZSBibGthZGRyLCB3ZSBjYW4gY29udGludWUgcnVubmlu
ZyBhZnRlciBmaXhpbmcgdGhlCj4gKwkJICogbG9vcGVkIG5vZGUgY2hhaW4uCj4gKwkJICovCj4g
KwkJaXNfZGV0ZWN0aW5nID0gZmFsc2U7Cj4gICAJfQo+ICAgCj4gKwlmcmVlKG5vZGVfYmxrX2Zh
c3QpOwo+ICAgCWZyZWUobm9kZV9ibGspOwo+ICAgCXJldHVybiBlcnI7Cj4gICB9CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZl
bCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0
cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZl
bAo=
