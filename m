Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2742E50256A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Apr 2022 08:16:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nfFGF-0003I4-6g; Fri, 15 Apr 2022 06:16:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chaitanyak@nvidia.com>)
 id 1nfFGE-0003Ht-5E; Fri, 15 Apr 2022 06:16:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rBkQBjRSn9XGMGFyMCBwAEJr7XdtAp3lo0AoSBJHgvo=; b=kgxgBZg9w5P/1v6wfHCoV2bwgX
 xudtTYgVGfTdKd+i+Ek3M3/T595Qg/rzW2Qc5Ljv/+dwJ8jGWBH68nzOlHh6q21Fbh2ssxLJm00nW
 QyhaZg1v0A77Ai3mpaysvtp9la/g1b0pKZzAOSEdScRNWVx/3Vuqkl99msi/6LsVvftw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rBkQBjRSn9XGMGFyMCBwAEJr7XdtAp3lo0AoSBJHgvo=; b=kQeHRUub2+dqmtyvCQJGqA4BLT
 8nSY80LmXbB9o0UXry4Ea2UwZGASU7anQq6XyhszlALuFBSdPh/8aEjzLJG6Gf87x6UQtGuWSEUni
 v1cBm/1ln4Z0AO+XmJQ12w16aWX0Q5qf+Cx+WORYzc/6uY7clbDtkAapFXn4NgEK8tp0=;
Received: from mail-bn8nam11on2058.outbound.protection.outlook.com
 ([40.107.236.58] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nfFGB-00059H-BO; Fri, 15 Apr 2022 06:16:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7V/a/shH/50ILjNRowsunIUKIrGOFQk4PtG3aqgLufUl3eo9FFXwRzTWPP0RHT9QEPFzVuAfsmM6PCRYN5uE0isK63LlyeHjOY0AhybDM7EYaEv313h0B8JQcoGkJ+P8ou4SSZ68myiiO2W/zAJlZIMyEJugOt6pa+EHrzzsdEdgeXfyQ2hrnQuoV+qMhRt7jvZWTcwHRViaer362s1SoSvXNtAczEOt7Su+OGs3u5WCNJHPDlWJpBlIIJWUsCudfYCIgJ86AtMcbg8PUDiz5JxKqcz1mVsoX3/ySLAnqbhQxP+XN7M+IT4v0LILgblyOpkIBzIt9jwEGjNnTbO6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rBkQBjRSn9XGMGFyMCBwAEJr7XdtAp3lo0AoSBJHgvo=;
 b=La4HVrWc+fl6CdBxWbYFJDk0OThR0snei0TmD5q5HBftn4TOFU0Sv30q9DPkrYRZP93DneBDXzStfiizo/VaGF5Dq/BIxFJF9Y3j/RLEXqPmQWS2xJmz76k+Je7dYfNX3BwNEwY3a5ns6xpYYd0JFRi/VQDGiSMFpWPLxr4FSqEsaLnl5xTh6/hI899c4xmOYJXwKh9mMzz4SGPWIaxNU9frp3hdE+4hCh/pRxbUAhElptvjZKAxwao31fVwnoZaSyHoiat4R6Zs54X3v5V2I4PIsfoCi8ET5ZJEeGoV2kMrdTpuWI2kHG6nXbcpIXbRvnlchf0h5R3iS4OKqP7Hsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBkQBjRSn9XGMGFyMCBwAEJr7XdtAp3lo0AoSBJHgvo=;
 b=TD25AIYRb8iwCA9fahL99Olp9+/Hgztmyc7Cke/aNxVFMkYqgPmEKIa0h9K26Lizf8FQtbpJ6ZrI43SRYXUa/IEilbPb/yWrsMWKkvVMTb5eGrmKtloM/HeeGoLG/okNV7PxpECiAiiYRo9oQlbfjDmkiuiTM6mgxRU4PVVmr6RXqlPoiVfxAOLCq44bzbjr04GIsU+i+wkYwmXqFd8z069t2I0ex/3qnxQewZ5y7zNzeShvVEPpwZo9kcCoprtQzOE532RcrC4q5AQc5fs0lnzBrqkQUccvapN4PmMnK+mDecb7Qq3G0+gQfrs7UHiuHRUHtlqVG0C/W5DVaZuTUQ==
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
 by CY4PR12MB1815.namprd12.prod.outlook.com (2603:10b6:903:122::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Fri, 15 Apr
 2022 05:43:53 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::a90b:9df2:370c:e76b]) by MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::a90b:9df2:370c:e76b%3]) with mapi id 15.20.5144.030; Fri, 15 Apr 2022
 05:43:53 +0000
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 16/27] block: use bdev_alignment_offset in
 part_alignment_offset_show
Thread-Index: AQHYUITgGyb6ZxOVoECvHtCH20IFIqzwdokA
Date: Fri, 15 Apr 2022 05:43:53 +0000
Message-ID: <d4d70cec-aaef-27bd-4d29-7382a740f192@nvidia.com>
References: <20220415045258.199825-1-hch@lst.de>
 <20220415045258.199825-17-hch@lst.de>
In-Reply-To: <20220415045258.199825-17-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fadb5741-c217-4402-81c7-08da1ea2ece5
x-ms-traffictypediagnostic: CY4PR12MB1815:EE_
x-microsoft-antispam-prvs: <CY4PR12MB181587392FBC362EB9BA46BDA3EE9@CY4PR12MB1815.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /zPE7EFfZCRyhrUuJ8xZg9ucWLWFwJmvS3SCCy3Gaw/2yxq3SLG9KlcHIP+uThF51l80EN6TZSRiTdQYGcRu0jCdhuALoVMKwS8W0pRofsGVFS2xSGj41t91O6b3SGy+xBhR0pwJvhvExxhfgFMeJv0kf4NLE3kzDlCKkQiUSHe9UUFRHRiu71HiTj9048fpgx+LMHahpSNX93/a0NzTVZSI34Jnz76e3Zbz5izJ0Btbe01tt33GWjvGm9MTZSXMrbEGKj+kS7mHGob6GbOEfPMtU9msKPzYGpb02V1m4UiygUdR2JLzyHKmSZ+Qk2YRKEOWnH51jj8kUevfIc6zuDr6NdNQR2dBO4u/kxc3pW86qOc/ly7+l5ASnifdFRNBlGObIMk454XaCAJCG8Lb/FzQnENxr3ByAWVaZjA2UUOU54L09Sro2bC+uf2XcSeLQgrUF7ONhLnwI5Fijea+cZY8H4fztMTlN3TZ/uEd9ApUgyy5udU1p9XTYcxj++ua7g47w3aeX7Y5VzkSGbmquc4wRnCJBKrD/sHPCbPVgvd6yujzP41M6MslnU2d/EfCPWdTo3HBEEduFrUZjh+X7HW8TYgvVDdXfTH06HgyG4GnRRnI9J8fUjx0QN7t1TNLvC52WnAi765Nyg1VPPBrl3i21BYZ901pgAkXDGXI2t1yUM7IV7ny9/ixyZZKXV53DwJDjsiEuGwzKQpZYABsQLuZZnLaLSXEfn2lkfqCxswy/6XXTaLwC7+nDFr/m7bYPN/eTEB9T3cxQN1Vc4nNqg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB4667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7416002)(8936002)(2906002)(91956017)(7406005)(5660300002)(4326008)(66556008)(86362001)(31686004)(508600001)(4744005)(38070700005)(6512007)(2616005)(186003)(53546011)(6506007)(36756003)(66946007)(66476007)(54906003)(110136005)(71200400001)(76116006)(6486002)(38100700002)(64756008)(66446008)(122000001)(8676002)(31696002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QkhLTC9Hb1B6S3FOdlFHNnJDNWdpYy85WDdZZWFmTW9PalFZSXZBbGxNeDZR?=
 =?utf-8?B?OUI4WFg1M2twZmZuS0d5b3VmM0RJZm9KWGQ5V2VPUXlxNlFKa3VjZVVsUHRE?=
 =?utf-8?B?aE5KOUFKRXBHb00xSjAyUVhnUnJ4VzBlNlR2OTVqZTZCS2JlYkJaNXFmZk5W?=
 =?utf-8?B?QWtTS1E4ZWM0NkplMkNnSGJuYXEzYnZDRCt4UXpnN3QvYllydGZZS3JNUFJD?=
 =?utf-8?B?dzlya2l1cFROcHB0WG50YnRmOTUxZmtFcWJYYkFxR3IrTFJqTHFTbXdjd2pS?=
 =?utf-8?B?UHRhcFA5dTdGdTV4dGx3aGtwemlDbkxCYjJPY2Myc2tpYS9SdzdwWlBIc2pR?=
 =?utf-8?B?UDMxSUpKWE9qYzRmaTdKUXh3MjRyOWhXM2ZGNHdMajR0alRQYzc0eHNUekdm?=
 =?utf-8?B?Z1ZnRDVNUldxcm1xREFydEdSWnJJSitIZnpMMW9odGJPOEsrUFZKYUhGOTVT?=
 =?utf-8?B?WndnNG9hb0NPb1NTdjJwZDJNUGl2NUpSWUhoQjMxRDN2dzhOd0s1ckdvaDRP?=
 =?utf-8?B?OFZVQVRSUS8wVndOTytLcE8vYnZnQ244bGR1MHhvWGR5MFBoa0NVcm1DTVFH?=
 =?utf-8?B?MFBFWUhEeERFZmlINEpqV3ZPZ055cUVMcytyYWk4MEc4ZXpZUGtaa0l4YmFq?=
 =?utf-8?B?cVMycGhwREZhZXUyNkNqblZ1YnNMY0RBczd4djZJSlFCWmlNZGMreTVSL1l2?=
 =?utf-8?B?S3hDWElZaXZWYjJQQW1jWk5BTFN0VFhVQTRla1IrNWdKeTgwdTBIb3ZVOG9M?=
 =?utf-8?B?VFE2Tkp3VHV5S1ZPcXIwVUdwSDJ2bUhMMG9yTWk2VlEwQUpmVWVNNnJ3Rzd5?=
 =?utf-8?B?MjlzQlA4TVd3Y1ByVWZyKzZWQmQzdHp1V3kxNE5Zdm9EM0V4TjA0UVNoWmp2?=
 =?utf-8?B?czAvdUpiMERNeTU5UldlTlo5NEpHczJmcno5bGxaRXlzTklhV1lpVXU1T3JL?=
 =?utf-8?B?ZG90RzJKcHU2RCtwNDIxWWVqSjNCaFpNaXIvaHNZak9QOEVZVE5UT1kvTEpl?=
 =?utf-8?B?QUxhSlBNb3JUL3NWTHcwNG5OdU5haWdLd1BndU5MZTVkTUloRDU5aHNaeVZL?=
 =?utf-8?B?TEUzSkpaUEVTcThhdnI0dDVaKzhSckt2NkhJK25xSUZLbXhLVzdEcTJuQ1FB?=
 =?utf-8?B?ZWs3TFE5SXV0RXBWT3dXL2RLOGVVVFhEcklFbmRjU0NheHVadmRYSjc2VVRw?=
 =?utf-8?B?bHA5OVh6cmpEbjE5VnlncEE4UUgwemw0N2wrRSs0REp6L3o0bjNQRFRHYUlr?=
 =?utf-8?B?WGhqLzJJdlhoMUVjcTVVUm1WR3UvRDdra3BhZzQxK1VWTTd6d0ZiWDRhZjUr?=
 =?utf-8?B?NitvS2dtZExkZzVvL0prS0tPQkJtdnFjNlZ2cW85SzAwZS84dUhhR3NzT0VT?=
 =?utf-8?B?WWErM2hId0NrTkZ4QS84RVhBK2tnd0tmRXVsYjZrR3VwNWkzNGVmdUpFYTdl?=
 =?utf-8?B?NlpsVzBTbFlVYy9xMzBYUFB1a3JPRFl2QVJqRzFJWFl6ZjVSZ2VyQnZMYjlv?=
 =?utf-8?B?czhiZ3lZTmpzTXEvOFAwNldYb0FqYW9pWGVKZWkwckZOV2F4cFBCNnorcWxo?=
 =?utf-8?B?T3hxaC8xYW42SnFjbmJVZ3FaYXYrcjZiLy8vU0tLcXdTMzAwbUFhbGViMlhp?=
 =?utf-8?B?QjFaSVNhdXVvaUFvMWtDMnlJTG9HeHNkMXpXaStQOUpQY1RUbHpJN2UwM0lT?=
 =?utf-8?B?ZmcwcndhQS80SFZKY0t4SjVqWUpyNFJqU3BtMUVYM3ZjN1l4Tk5wWnZzYkxR?=
 =?utf-8?B?YlgxcTV1bWRMUEdMWWQ5MytFUHBsMXZSUXRwaENTaVEwL2pNOXNvYjJJOEZS?=
 =?utf-8?B?eHQ2dm1ySi8zZjd1eEtXWTFZOFFwdlVobitnUS9yaG9nNHR6eDA1Tm0xWkxt?=
 =?utf-8?B?SWt4Um9NMmc0WkFsTGFIbW5uWUY4Wnp4OGFCZ2tpMnQ2VmU3QVB0MVQrQ0l6?=
 =?utf-8?B?NUdmeVdPQndjQVRxWVlVUSttOE1CM2pyVDBoMGdObE00aDBxQ3hZNnMvRDgz?=
 =?utf-8?B?MGpCT3hNL1FPRkRJZEJOdlZZTXN3b0hSOC94VGYwa2lENDJLNzhsbkdycWtT?=
 =?utf-8?B?OFdFeldWWEpFN2s2Nk1wWTE1ZTZROXVPbWl2R0l2UEYrWUN2WkpaRG9Zbzlt?=
 =?utf-8?B?S3BzM3NmTjdreEFPMlIxQUh2dURrK3drbDZ6UzZUSUg2amNiZ2tLVGkya0d1?=
 =?utf-8?B?TDErRm1PTHNrbnRuQWc2M1BEU3hrSDNVQ0pyYzAyVFJZLy82ZHlrY09FOUR0?=
 =?utf-8?B?M2hTb2ZOUnh5UWN3c3cxK1o1dGpBMFFpdEpLZzJubGVDTGhsMEhPOXRTZEE4?=
 =?utf-8?B?ZDR5bkFrZWlMbEUwRHd1RFdybXdURFg5bGw1NFNvRzhEV29zTFZIL09qZnJY?=
 =?utf-8?Q?AYvHXapXcoGFw6Gj5LPtzLlzXjgd4w5ny2Ge1?=
Content-ID: <082F7C538FC35349BB8BF71526006F64@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fadb5741-c217-4402-81c7-08da1ea2ece5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2022 05:43:53.2939 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z89R72UQaC+/+ZifCAazwywTUZEAu78qSqfzKG51E0QeCoJkksyXq4ipp5lT82IG6zIQc23xZHHhe3Sr5hGvgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1815
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/14/22 21:52, Christoph Hellwig wrote: > Replace the open
 coded offset calculation with the proper helper. > This is an ABI change
 in that the -1 for a misaligned partition is > properly propagate [...] 
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.236.58 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.236.58 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nfFGB-00059H-BO
Subject: Re: [f2fs-dev] [PATCH 16/27] block: use bdev_alignment_offset in
 part_alignment_offset_show
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
From: Chaitanya Kulkarni via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chaitanya Kulkarni <chaitanyak@nvidia.com>
Cc: "jfs-discussion@lists.sourceforge.net"
 <jfs-discussion@lists.sourceforge.net>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-nilfs@vger.kernel.org" <linux-nilfs@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "nbd@other.debian.org" <nbd@other.debian.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/14/22 21:52, Christoph Hellwig wrote:
> Replace the open coded offset calculation with the proper helper.
> This is an ABI change in that the -1 for a misaligned partition is
> properly propagated, which can be considered a bug fix and matches
> what is done on the whole device.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
> ---

Neat!

Looks good.

Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>

-ck


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
