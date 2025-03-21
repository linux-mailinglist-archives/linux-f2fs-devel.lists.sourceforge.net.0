Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA8CA6B3A5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Mar 2025 05:21:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tvTsx-0001gy-Sj;
	Fri, 21 Mar 2025 04:21:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <songfengcn@hotmail.com>) id 1tvTsw-0001gp-Ow
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Mar 2025 04:21:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :From:To:Date:Message-ID:Sender:Reply-To:Subject:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=; b=BQRrhcwgx9eTtL6uabKO93Eukk
 UBPZCc2Ugr5jWDl7Sh5UKTTGVZV0Yty3Ny8mh9eUcAY78HL4pjvho91r6lnFfj2AEymVjqnfO2ps0
 KAPxA/M3Z5uIXljavZAf5bpUS2m+vRSPwdJl8cD/Cu6gJpq7yx6nwoMLogYl80YJh67M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:From:To:Date:
 Message-ID:Sender:Reply-To:Subject:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=; b=C15PWYx7Ac6sa8+C6gHF9tkzPA
 Uovlg1HrQJ2yTO4jnN0RNYZVSKFGlUi1jIvIzql1XK6tMUHm7ZhAssSbFH2ROlYb0AS56YWH/IEBE
 2+BApljj7qKMS/SKttUn1bLUXPsPWqEnuWTiFUYLw9r09NhpXHj9bUa5+1bq+KDF86UI=;
Received: from mail-co1nam11olkn2080.outbound.protection.outlook.com
 ([40.92.18.80] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tvTsr-0001ng-IR for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Mar 2025 04:21:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=siKNDnC3ahi2YpBm5HGzJjeiwC5jeD61mOWZyow47bsWnQ39y/X3uqP3I3Ypmka1uVIels8xDPoqo4IEUiHUmLnAK99hDUxO6QVIBRz/ZL5VE1cZr86vY9dWRKRVMnKHRw9AogRACNholcoNf2y8/PoS+2TioXaDbg26maEkwNY0dOLAQaaI0Ybpn+lFTRXNHXgJTN2W7X/Ozi9p+UjjnGElWaTZtnk8nyjGXQkCuqGEzKobAfVI9Pj9/CckiS46YNlvF/MAnTIMw6aU+gZF1FbuJgbnLPbX/RqeGR18ysdL98S7MUHpJtxdKwrQJ68eDNcHrupmWi7qIcBo8ffpMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=BU3N6aZ3fAdW07dB4LNes5Yhj7LHWAY98XvOBLy2SElZdvUpHk4KTLUMP15rLG6e+nNXf+FcJFfsGGUWPeu4vpZS1+Mre6V1uGutwskTmb+KLGZASqiC3XdUU8kgG5Uqea7LIrk6hoSzR8j/DQw66MQo0RWFyjatOWzPJRrF2LRCiks+jRrFdaa+SuWvCHpQlc9R4pOyYz233jOkVEdUZu8RBUjLhnWfj0P7el4a89G+D/RFSQlXxRqOvzfOokTpwPlvvL1RVtYG2YoD1FfI+qtbsJZnDJ/lpzXlWiFQWhoCCiTIAUvE1cMSfa1FjK/Zy2ZtzgG8ToOdubAjFW2z1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=DkZgjpJGa9zfNRwx0WIgUdCGmwqZoN8j2APv1CZ+zUS+vvNWX46ofj1+k7d5mvE5lu+VJnm7x5rnYZnyWEE2mgdud11ncaMtMeSoQDg4Q2uMNqCU4qEOKrYnnNn4n0T/t2lV6bXhfiuWRxhlB3/WaNNZEwN+tZ9Bl/6TUtawCqnmAdHSfprjdplANeyaYNaBAfPdUVECBLZfwOL0EPiwJfGYG8MvxJzps+1af3VeK1FC/FR+Mu/RoQ/DvPILbXnK4iNulriULSaq/PCzFwqdSg/pFUDh5lfDtZRLkfyaK0IcawaYLtxGXHo26hNeD7zJsevCO6TAI17C0WQbKBjV+w==
Received: from PH7PR22MB5400.namprd22.prod.outlook.com (2603:10b6:510:31c::16)
 by IA0PPF3D5EE5909.namprd22.prod.outlook.com
 (2603:10b6:20f:fc04::d1c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Fri, 21 Mar
 2025 04:21:19 +0000
Received: from PH7PR22MB5400.namprd22.prod.outlook.com
 ([fe80::c4e8:8b9b:19e:f64f]) by PH7PR22MB5400.namprd22.prod.outlook.com
 ([fe80::c4e8:8b9b:19e:f64f%4]) with mapi id 15.20.8583.010; Fri, 21 Mar 2025
 04:21:18 +0000
Message-ID: <PH7PR22MB5400F279B088C6365A502656DDDB2@PH7PR22MB5400.namprd22.prod.outlook.com>
Date: Fri, 21 Mar 2025 12:21:05 +0800
User-Agent: Mozilla Thunderbird
To: linux-f2fs-devel@lists.sourceforge.net
From: Felix Song <songfengcn@hotmail.com>
X-ClientProxiedBy: SI2PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:195::9) To PH7PR22MB5400.namprd22.prod.outlook.com
 (2603:10b6:510:31c::16)
X-Microsoft-Original-Message-ID: <f797c814-2a21-4106-967c-c91b38b7fd38@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR22MB5400:EE_|IA0PPF3D5EE5909:EE_
X-MS-Office365-Filtering-Correlation-Id: 1feff432-984e-4c90-c10f-08dd682fd3ad
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|7092599003|461199028|15080799006|5072599009|19110799003|6090799003|440099028|3412199025|3430499032|850799032;
X-Microsoft-Antispam-Message-Info: AeG8iJEd06m+zstmOQtK6IcblwoxDMQZl7au5AuQYiTZH56LuhmtFrfAjrs/HreB6cKWt1hwcEclLoWjlFEFYmbj885rqUXU7H/7+71nIstbFgx6hb479Oc7db1/SIcyJOOXoo0mWvDjOTQTHqApQUGW5nZK6+Yae/MQJfRTnwL8lJH8e9i3UXGsOXq6XzpSSfvd+Yo10Jv3urwc2Wvez/Y5cbfPdXmv7y3ldZhbII64innk9dA2L1Z62Dbmv3KhX37g/WplgA+PHCX9HZkabWouBOypjtxexXB35FOUdewg9mQHAuwWo3WWBt53sqB95Ay3CQAEXxlQL0eiKquDmKo0splX22+2lcZ7lvKgyazbGUPnWm1rbwCKPeJJwOrFHfb6GjBrgtLC48chjRkN2bZWJDt6dpwx0e50PPoxHuYhQ/HYZLqI/K8t6lbw9Hg0x8rX6My8I/1OZK7z3di5TcXQOtW7/2h2JTCxnamW8X6E+RsbQ3q/DEBkdvxklwoofS7/FDgNu/QQ0mAO5p+v7o1snwrSLSys9wM9wk43btw3oHMD795n3jXXY7D48QhPZAA91A1ft8aaH+Ge8zGbnasgjQRUJyAc9Pz3N+SwX6HFjiEpsjjGOHaJjp47FzRlDLADiYnGxl95dNFvdwv98ijqLW5homr2ZjScJlrqFq4FAxXY4K/sfHabLDEhYcnXA36MvtJgwor3S0xoiOq1zMO4sfvZI4+oqfXbqmQx26LpYCtJHwLWxYu+kYdkhgRN1k+p7jkX/BY+JodYZ6izXy0Jb117wCcljiblYSDGO53L+B6taiGD3zV350TaVcD7hu1xZNEf7D7IxSY4ORDy8d48NmsNYmbTEAoOXgCm+Vg=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXVjWXB3dFhWSDVFckFjUVlxakgxeFpiYzVZZFBSMWNldEVTbXlyM0RONzR4?=
 =?utf-8?B?L0VVL3Q0Wk1aVFYxSVY3dkdtUzFYNCszYVlzTnNWZTJFVnlyZENjNUdESm8v?=
 =?utf-8?B?bEJiSFQ3L2V2MTlPWXQ2bFJHTDBmUlNlT3lhU3VFOFVNMkxSazE4Z2E4eU5r?=
 =?utf-8?B?bHBpbjdQZEtmaXlHV3BiS0h4bmZJbzFCQzJzY2dIZWZTU1NMWlNKbC9ITU11?=
 =?utf-8?B?UkkyVEt0endiU29nMWJPUnNEMkloanJnOXVEVHU4bTVVcHpiRFYrQ2hOeEdr?=
 =?utf-8?B?WC9yN2twODlXOVhoTFBwQktjSWR6Sm0xS0NEVHk1VFp3OThUdlNyeUttQm9B?=
 =?utf-8?B?d1FZdUEyMU12Z1E0MnJJMi9WUXBDOWhQVkxidWdvUFdVUVVmU2wvUWxnL3Bj?=
 =?utf-8?B?LzNoWXl4QmszZ3FSTDQrdEtwb2tGcit6ZGNKaDg1REN1TlZNTW1vUThab2NI?=
 =?utf-8?B?SElCY0RpVmVVRWF4U1RaRjkyRFJTWlpmWUJpZlJKamErbnVYUnMvelVyODcy?=
 =?utf-8?B?SGJyb0Q0aFdjVktONmNFV2pRL3VDbCtuUHpqWGNka0JkMUF3akFJTndJVVpN?=
 =?utf-8?B?SlIyWWZFS25JN3p4RmRGSEZxMGtKeFVYeDduZkhvK0VkbWVXQjFDaFdlRFRE?=
 =?utf-8?B?cWFtdFo3T05rTkdBRGFQRllVU2RZYnR6UWZhSUUvYldZclBod0wzTll1ZXQy?=
 =?utf-8?B?STN3RlYxaVZYM3BGZGNNYXB3ZUFKSDgydk9FVTdIUHdhamdtSFVwdU4xaTRq?=
 =?utf-8?B?MmRoZGRTK1hCWENFL0tsaW1SOW5abzN3L09SK1BCYXBIanNKa0FNSXgxRFdp?=
 =?utf-8?B?MFVUcWZDNkpyTlRUckR1ak9NM1FTdnlNVGJ6Q2lTUkdCTzg5T2Z4eEJweU9C?=
 =?utf-8?B?bStVWFpSQTNaejZRRkVkMzFOcEhmRG1zUTdPL0tGMDRlYUIrSDQwdlJWdlhZ?=
 =?utf-8?B?MXErekk3UUNrOXlWL0V2K1hxOUZnYkdtZDhCeHl6YWFpMTk1aFNoQzB6MjJz?=
 =?utf-8?B?cXZXOUpMNTNGRjZoY2x3amhkQmU5NE5EOXU3MlB6MzJ3alk0RERJVHZLd0hi?=
 =?utf-8?B?TTM2YWZzdnpBb2ZEaTc1TEZnNkt0VjJMUWFrNkVBK0FQU09BOU5XS1NYaGhz?=
 =?utf-8?B?VDMrVXRzWmJDS3ZUc2lWRjMyamp5d2lXU2pIdENEeG1qUzNJSEpYVjQwN2sz?=
 =?utf-8?B?Q0xJMklRZDBDRFhzUWdrdmVFSnhYMzY3ZVd0WU9ZemZLV25HRzZhQVExQ0VZ?=
 =?utf-8?B?aDJWUERQMlVPOTJmUHFOdlBTN0E4NndBR0NRRDZIMGhHSEZCNmdxc1psaG95?=
 =?utf-8?B?ZlFxT1U2NnNNeE5oZ3ByWC9TYnpnTmt4dUpDZmRUbVhKcFFKOFlPbG10NWJ5?=
 =?utf-8?B?bGhkSnNjajVGYW5KRS9Yb0pwY0hsL1NNS3Q2YmJjU1pGczd5ajUrb1ZCOS9V?=
 =?utf-8?B?VEhERDBXS0xad2N6Uk1hMUMvakdBOE1VTEZIZlIxZEhNUUNvTUl6ZzJZRUxq?=
 =?utf-8?B?clYrTkM2bWQ5MUs0cXNGNXJpUEJiK3FtUTZjNEI1cmxQSHVNWDk4MGxiRUNM?=
 =?utf-8?B?ZmV0OHhHUU02R3JJZ0ZOQjdqcUxuREtIWmNuZkdNbVJZYnVmd3BsaU0wOGxx?=
 =?utf-8?Q?9LXzTkNFbf43C1n4bUk8p7sldGz1HKv+nBRQCRX6YOcM=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-7da6c.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 1feff432-984e-4c90-c10f-08dd682fd3ad
X-MS-Exchange-CrossTenant-AuthSource: PH7PR22MB5400.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 04:21:18.6583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF3D5EE5909
X-Spam-Score: 7.1 (+++++++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has identified this incoming email as possible spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details. Content preview:  
 Content analysis details:   (7.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.92.18.80 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.92.18.80 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.92.18.80 listed in sa-accredit.habeas.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.92.18.80 listed in wl.mailspike.net]
 1.2 FORGED_HOTMAIL_RCVD2   hotmail.com 'From' address, but no
 'Received:'
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [songfengcn[at]hotmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 2.0 PYZOR_CHECK            Listed in Pyzor
 (https://pyzor.readthedocs.io/en/latest/)
 2.3 EMPTY_MESSAGE          Message appears to have no textual parts
 1.8 MISSING_SUBJECT        Missing Subject: header
X-Headers-End: 1tvTsr-0001ng-IR
Subject: [f2fs-dev] (no subject)
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
