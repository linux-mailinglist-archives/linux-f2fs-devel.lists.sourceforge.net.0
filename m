Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF07B9748D7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Sep 2024 05:43:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1soEGp-0005kX-Ic;
	Wed, 11 Sep 2024 03:43:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1soEGn-0005k1-H3
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 03:43:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hJpfXRt+D/Xi10u7fADuMjbX+4YLotlKl+Ws+v+nkzo=; b=KhU4NZMk1vGJ4YeRbFhRHMSscC
 tliHaiIERYu4cL+Pwqzl12BKHewiTeCBpZe/ctxRsX578VR9xaaZnjQDf6qLs3kob418IwodiCNvJ
 hvvpUkp2wDVYiG9JlhNiD8MtS/306MQqOmx/mKCTNjlgYj+HjeLIXxRBezVtzIvZxaFE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hJpfXRt+D/Xi10u7fADuMjbX+4YLotlKl+Ws+v+nkzo=; b=Ll2qi9DHEiuHnuJRhhw2kCjLTw
 ulUxzZts2/JkVzwluts6dUr8qGy8STU1IyJU2RcErhJqQubhFNCPm44uu/f5WzYk69nMbSv3wSrfC
 uMg6Q46qcZhO8yvjUMdrZGqze3fD8dBriM+T2AIMwCbNVrMl5tyrvLhhU7ZMB1vscGYc=;
Received: from mail-psaapc01on2082.outbound.protection.outlook.com
 ([40.107.255.82] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1soEGm-0000Nz-Oa for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 03:43:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CWYX5xi9CvIOQskeUDg2XR0LcMaGhBf/mVNvFnk4P9zjeEpLkF1RnbBVRsc9CfUKu9nRNl2QdX4eYy4yVBBepNtVKZtFMIjO+mQO9c0tL+Y8o6p1eRvlH29ipQZOWstHJwmZ7asCUeE2Q6gq0Puq0GbdGLTZwNKTdMjhlgFyROCLNWhkrgL59H9DrMWlW8n+XKcHa7oXjusb/ruSSeRK3csw6kGXQwqGasKipBcN26Dwga+U1PhBL2nrtB/JOoX8ecA+kxHAJA7JZ+NmOsMpM4faZd9wgJu1S6pN7trRCVtL2rFqhF9p9ZxH8vcaWQ6zYqudDCh3q6T6VCrvGooR4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJpfXRt+D/Xi10u7fADuMjbX+4YLotlKl+Ws+v+nkzo=;
 b=LcCzD+eB35gxxOevA8wIV7xvfrXcpGT9qwSmSTVeFGSAeqjyjruhHecDs9WOubO8zXU6p9OrS7Y51MKHNKPb/uSlHBM6mDhgDsXD5gb939XrMeQoRq4K3/WiTutuLB7AOWidjwVyTXe4HyqIytVcgqPbvDHfsr5R0kb2KG9mV7rvtMMqAT1vSxDpbyPSU4c7N3RllwA+0OJmRrmNJGrDkYjnPTbCGDZ539kHA3lpkh1gTTaauMQhb5Lddp/5T4wduOMsVSBbfOEMEgn/4DVsUlELsHziLL3XT3e1TOAZuH89hcuRY3e6PUwrfY/aSEtd8gfyVoMaKVHm/bsZF8jLVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJpfXRt+D/Xi10u7fADuMjbX+4YLotlKl+Ws+v+nkzo=;
 b=m/KsiDEQFaBr+X1O8eN0pMWwrQG+e0jZTe6t1vulmBbKf3zQKagZwa7ReP6dwRl78O5sV4ThIYaHYVRpWLqI6af2Avl9Wip22oFLRZygFnXDdfSdtbTUC29ZRQQ6meRIVctSjrki5HP4d38glvSGRYR2yhU0IQhUo96Y6G7JrOux982jN+Q29ScZ5RES6T77V6yQchroe4OV4gz50+QjAj2l42pO2LA0a5ZQxuaQmQ74l3lPaA5ceOTs2kK3vZfPytB+cVU26jl0jwAqFSU+w9OGsI1Aje9VRu2NWl+ktWXyy6YYPdgk+U9OvqxRSg58wWUB47siw4srihi8WypRww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by JH0PR06MB6917.apcprd06.prod.outlook.com (2603:1096:990:67::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 03:43:47 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%4]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 03:43:47 +0000
To: linux-kernel@vger.kernel.org
Date: Tue, 10 Sep 2024 21:57:25 -0600
Message-Id: <fbecda7cba8a51a8b685f6d3138a04a99b93e46d.1726024117.git.bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1726024116.git.bo.wu@vivo.com>
References: <cover.1726024116.git.bo.wu@vivo.com>
X-ClientProxiedBy: SI2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:196::7) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|JH0PR06MB6917:EE_
X-MS-Office365-Filtering-Correlation-Id: b70cfb3f-8389-442f-b9d7-08dcd213f12b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3IOuxKljOkAkHnxeIQ0pnX80Zvs5Ra4LQc92DrRhqVISIGFBPU4AYeouJ/01?=
 =?us-ascii?Q?3v2ZYIOgtP+SSDzokOB+oJQJCdUmAF2yD3jSCz8+wrADD3tt+1gOSNFzHCVN?=
 =?us-ascii?Q?P8aZi+qOdQ8iXBxQvhlTG8NlSf7jK6qefiemq8yHVJB15jN6rmiDtbw5fQpd?=
 =?us-ascii?Q?OWAlzduDK1n2bOrs7/64dp0ox9h4EjMnlGRh3uwYPW3swUKCOXF4TJSmdY/p?=
 =?us-ascii?Q?v0ZoW36NLTCkDarqe02nkpcwx2R8hPXtwIOIyhFrOo6Yly/FjofY5LTYX5TI?=
 =?us-ascii?Q?aYpVqX8kO8XXY6OZnywVestmVasMhHjS565vNcprozw/k1WSaygObnY1gxj1?=
 =?us-ascii?Q?uK4mGQ8P0/MpTpXgvJmVpeY12HO9wtbRjlkJlidyOJ1ypdAvYyBHX+lB2lSi?=
 =?us-ascii?Q?M2NZ/lzQuHo7xNUzoHOoPk+OeBcN1ZIggDdcgCXNSakLqSjk7S4UPYqIxMmb?=
 =?us-ascii?Q?e/XH0Qo01bp0jjngzuyGQbtts3HmBlBRW5iO77EG2a37JkIl8AEGaHDa5zSU?=
 =?us-ascii?Q?RR0VwB1EkoNLanNOC8L6Dueeeld+SYgT6AkjGq7Y920pHtpktpsM92aOdpPf?=
 =?us-ascii?Q?ociYQthOEH+7FJvTYmVX0w3l0NaRae/udQbX7ca7+SeAcPvWHLZN2SyoAsX6?=
 =?us-ascii?Q?zL4fNBoSsMOAzLu0rg5dV+Ig0p386UJf0Y7FweVkE6W4MqzagCy7AI73adcb?=
 =?us-ascii?Q?PrUIF7J6zcbjFBAZbitDYDz6Z/uzuBzQ/9d4f1hbu6Jv0Oot8MlBVOZWW0D4?=
 =?us-ascii?Q?1PE7bWwRyO/WOIwI4Wy/bKKzVRaRbhU5W3Y18O+YofRLVMBHQgghEkwrMaFD?=
 =?us-ascii?Q?O59SaQK+wI58KOUot7JrGPobwBvaNLF0jbMZFciFUK3rIAGHLXaZ/66VpQ9m?=
 =?us-ascii?Q?4420QNie44TI5XMKVzcqg98K9mFLq7sz3i42oGYP3shUB6Jxkb8kcyrLLjZp?=
 =?us-ascii?Q?cvDaGBDgz7R+pT+eJ0f3hK/YJjvLiuhO63u2/nyoMhkSQ7kSMrPkr1wxDNWV?=
 =?us-ascii?Q?8Hm5HlMH4De4QilmAzCx0QuhtaCD1BFPqPhhtW23CnNvDVT3G42pOqESbrjU?=
 =?us-ascii?Q?5cEO8CQgkAisrRmGqT1S8u/KFPQviBIRnmi9iwkx/y/g8aumBQdnVUdT/h8a?=
 =?us-ascii?Q?i/r9M+mhFELzUdi8mERuHHgUeEByzBxw6DnD1XFABhMqVDXZinvoG6BIxcIi?=
 =?us-ascii?Q?vf9xODn1uw6e0vv+13v9Jp1PXe/VdroGpwDTPK7x07v6iiek/uNTCiOgJzls?=
 =?us-ascii?Q?rpDFVVF5KKTHyrMh4Sut75xvtUeGLZ6JmfnV6ckQNumJ5cJLaXm7YbPk3Z9m?=
 =?us-ascii?Q?SO8YfMxo7z48nGVwb3yG6inbD8HHfNe9NtuoZQaTsrkwSnRTy1BGDtPYwiSl?=
 =?us-ascii?Q?PhCmmJ3dcowbNxCTF0GVNisAtAdOovjjkw+hIUeVDVPJ3U4e2g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1XDYL6cG533Aflir+q+xbd4PIwAHpkMM7dcLzSB/ML9gKyVNjMSaiPfeSGMD?=
 =?us-ascii?Q?nVWhj4iaWfmPL7PmnB+PkuX/+VUqlmgqtU8FE3mLzY6M50G5lRiPWA+N9ijL?=
 =?us-ascii?Q?jN/zhMqtIAmpcUbJe7lu+rYjmMuiIK6joEb4YuVNDEXg9xxwbnR42qe1z8W5?=
 =?us-ascii?Q?RvEOM/yXV7lSfOUfTMYtqAL2UtPy0bKR/pwf843JClY/BwPuM8um9T+h2v/l?=
 =?us-ascii?Q?jZWGepD8CTKrMjjp1V3NJRW9JItF0aHmc4DoEFfm7Zr5soNZZJw+qmllixNJ?=
 =?us-ascii?Q?BtXiUW+uWAiX+ndoJXZNw1YOwE2Tq6l+tuCBt5vgwGxaG4aAMOkI4hPEc5c3?=
 =?us-ascii?Q?5T5txGBAUtfPayli2Gj2owKpCJ1cinTY8PbXNH15h5sIoEK6ybx6NLXm3W8e?=
 =?us-ascii?Q?BPCOmbUJjlVVPYnD1KFBoQGL3x7+ST/56VdHwHUnamm+LzhEgcEqKuT+5i1k?=
 =?us-ascii?Q?+zSNet2ajwRhgmzZqGky1RrTOvlU8IuC26EBYRo4Dms7DIeKeHuR9H0AMASk?=
 =?us-ascii?Q?4sIFFkY/L+vBPr/SFp1O67mQWTbyVuWtMn7QJBsBpKO69/pPfhJYdfjIFhX7?=
 =?us-ascii?Q?/fl4vhMKNQ5kk+NYgrFRihfNQyP9oN5iJCpfH5RiYbUbYZJfRmc4gl9ODquK?=
 =?us-ascii?Q?01fU+Cdhf8qHmnKJpetQVqBwEc53PrzBj6cvHeFvUGX5iMaKQCly6jt2aMWj?=
 =?us-ascii?Q?xOrhT/UN4ozGxe+Qk8uxPsRs1he8CwPvOciIurRZEnTEpqFhSQtu5g/oCswP?=
 =?us-ascii?Q?45qHSycvmxcBxQoENReCYT14auMtqPKSCG5l+p5u+dbjP4vB3/7MUOaJa/gk?=
 =?us-ascii?Q?AjlHUCTDddqQWuaKQHh4Pa4CtUJcDFpRuogW/slu3pv+GdVZyxXjDeMYTEj9?=
 =?us-ascii?Q?2/Pbl3C80wpogTtVDuXLwJ37MMx5WCC/Q1sRhSqNPY6FoMofrfQLdLz4V0GP?=
 =?us-ascii?Q?IFo9b5lyzs8eQqwnYtDoaZcmX58fkE6Atnf/5Kda3QPfEdcamoCAi4+hOeUw?=
 =?us-ascii?Q?dWvBbKsmZbM+pgPpxgqwUhyZBDHoHHW3CGtCaBdYupxsVsAd5bt1wB1EsaU9?=
 =?us-ascii?Q?TevHEvNiDZHKcRLQdb/A5zc1paZG733wsY+NL0obSE2IbKffcKWGRlUXSmZu?=
 =?us-ascii?Q?/jimTbA8OkJNJdYsoK63rhVJYm3VFimgSOz5B1lbmHN3YwiFwAI7lVtvhfXi?=
 =?us-ascii?Q?FT3k+lnoafRgBATCbUA9T6eI6Le42EH4RtL8nOiL4VssufLS2rR0X4kVLzOT?=
 =?us-ascii?Q?umYBxucgNUMEqrocLFxMdTynpixGlamAMA/9MEVGvQAPJkGFgboeGKimlt4d?=
 =?us-ascii?Q?HdvU/IuXLjXVL0SLtzteYqL3czlbfBmFK80aVrSeXkZeRk/ocRXoIotTapBW?=
 =?us-ascii?Q?GneK3RA/5diT1BQjNYvcYu4Q7MeT5SNhcg6mTV6GFK+l9bgFJasF/ryaH4+h?=
 =?us-ascii?Q?6FyGfVuoqrezuKV+MyXrcEUMXr9DZKy86CW2BQ22K7mPbCHxhVkZ5VckGs6h?=
 =?us-ascii?Q?gRmgYiNXUImlDgLfqUN3OWulMUr2CY+qFoicLO+rKk3I6peg7nazFckGLlXa?=
 =?us-ascii?Q?6pIHyv23IX02GsRrVR1wanOIeHuo3RTGaTq43KVM?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b70cfb3f-8389-442f-b9d7-08dcd213f12b
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 03:43:47.4260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: paU7Bzf2AWWyd15bVgVrrIXwJGtDqpXh3KLIdNEXcEDctMUMZE8CabBNhA6LJaZK5Sc1J7bfcp6ouzZJN4qFww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6917
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Like the commit: commit b3d208f96d6b ("f2fs: revisit
 inline_data
 to avoid data races and potential bugs") Due to the limitations of inline
 data, there are many scenarios where inline isn't supported well, such as
 move file range. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.82 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.82 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1soEGm-0000Nz-Oa
Subject: [f2fs-dev] [PATCH v2 12/13] f2fs: convert inline tails to avoid
 potential issues
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
From: Wu Bo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wu Bo <bo.wu@vivo.com>
Cc: Wu Bo <wubo.oduw@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Wu Bo <bo.wu@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Like the commit:
commit b3d208f96d6b ("f2fs: revisit inline_data to avoid data races and potential bugs")

Due to the limitations of inline data, there are many scenarios where
inline isn't supported well, such as move file range.

Therefore, in these scenarios, convert the inline tail file to a regular
file.

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/data.c   |  4 ++++
 fs/f2fs/file.c   | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 fs/f2fs/verity.c |  4 ++++
 3 files changed, 55 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f52834c1cacd..a59758e1c878 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4141,6 +4141,10 @@ static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file,
 	if (ret)
 		return ret;
 
+	ret = f2fs_convert_inline_tail(inode);
+	if (ret)
+		return ret;
+
 	if (!f2fs_disable_compressed_file(inode))
 		return -EINVAL;
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 64ea0bfc2e1e..3dcc5e363c13 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -84,6 +84,10 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 	if (err)
 		goto out;
 
+	err = f2fs_convert_inline_tail(inode);
+	if (err)
+		goto out;
+
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	if (f2fs_compressed_file(inode)) {
 		int ret = f2fs_is_compressed_cluster(inode, page->index);
@@ -1070,6 +1074,12 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 				return err;
 		}
 
+		if (attr->ia_size > MAX_INLINE_TAIL(inode)) {
+			err = f2fs_convert_inline_tail(inode);
+			if (err)
+				return err;
+		}
+
 		f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
 		filemap_invalidate_lock(inode->i_mapping);
 
@@ -1191,6 +1201,10 @@ static int f2fs_punch_hole(struct inode *inode, loff_t offset, loff_t len)
 	if (ret)
 		return ret;
 
+	ret = f2fs_convert_inline_tail(inode);
+	if (ret)
+		return ret;
+
 	pg_start = ((unsigned long long) offset) >> PAGE_SHIFT;
 	pg_end = ((unsigned long long) offset + len) >> PAGE_SHIFT;
 
@@ -1501,6 +1515,10 @@ static int f2fs_collapse_range(struct inode *inode, loff_t offset, loff_t len)
 	if (ret)
 		return ret;
 
+	ret = f2fs_convert_inline_tail(inode);
+	if (ret)
+		return ret;
+
 	/* write out all dirty pages from offset */
 	ret = filemap_write_and_wait_range(inode->i_mapping, offset, LLONG_MAX);
 	if (ret)
@@ -1591,6 +1609,10 @@ static int f2fs_zero_range(struct inode *inode, loff_t offset, loff_t len,
 	if (ret)
 		return ret;
 
+	ret = f2fs_convert_inline_tail(inode);
+	if (ret)
+		return ret;
+
 	ret = filemap_write_and_wait_range(mapping, offset, offset + len - 1);
 	if (ret)
 		return ret;
@@ -1705,6 +1727,10 @@ static int f2fs_insert_range(struct inode *inode, loff_t offset, loff_t len)
 	if (ret)
 		return ret;
 
+	ret = f2fs_convert_inline_tail(inode);
+	if (ret)
+		return ret;
+
 	f2fs_balance_fs(sbi, true);
 
 	filemap_invalidate_lock(mapping);
@@ -2010,6 +2036,9 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
 		} else {
 			/* try to convert inline_data to support compression */
 			int err = f2fs_convert_inline_inode(inode);
+			if (err)
+				return err;
+			err = f2fs_convert_inline_tail(inode);
 			if (err)
 				return err;
 
@@ -2172,6 +2201,10 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 	if (ret)
 		goto out;
 
+	ret = f2fs_convert_inline_tail(inode);
+	if (ret)
+		goto out;
+
 	f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
 
 	/*
@@ -2964,10 +2997,16 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 		goto out_unlock;
 
 	ret = f2fs_convert_inline_inode(src);
+	if (ret)
+		goto out_unlock;
+	ret = f2fs_convert_inline_tail(src);
 	if (ret)
 		goto out_unlock;
 
 	ret = f2fs_convert_inline_inode(dst);
+	if (ret)
+		goto out_unlock;
+	ret = f2fs_convert_inline_tail(dst);
 	if (ret)
 		goto out_unlock;
 
@@ -3353,6 +3392,10 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
 	if (ret)
 		goto out;
 
+	ret = f2fs_convert_inline_tail(inode);
+	if (ret)
+		goto out;
+
 	if (!f2fs_disable_compressed_file(inode)) {
 		ret = -EOPNOTSUPP;
 		goto out;
@@ -3998,6 +4041,10 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
 	if (ret)
 		goto err;
 
+	ret = f2fs_convert_inline_tail(inode);
+	if (ret)
+		goto err;
+
 	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 	filemap_invalidate_lock(mapping);
 
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index f7bb0c54502c..aaf3e754140a 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -139,6 +139,10 @@ static int f2fs_begin_enable_verity(struct file *filp)
 	if (err)
 		return err;
 
+	err = f2fs_convert_inline_tail(inode);
+	if (err)
+		return err;
+
 	set_inode_flag(inode, FI_VERITY_IN_PROGRESS);
 	return 0;
 }
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
